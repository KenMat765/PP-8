#define ROSSERIAL_ARDUINO_BLUETOOTH

#include <Arduino.h>
#include <M5Atom.h>
#include <driver/i2s.h>

// === ROS === //
#include <ros.h>
#include <audio_common_msgs/AudioData.h>
#include <std_msgs/UInt16.h>

constexpr int CONFIG_I2S_BCK_PIN = 19;
constexpr int CONFIG_I2S_LRCK_PIN = 33;
constexpr int CONFIG_I2S_DATA_PIN = 22;
constexpr int CONFIG_I2S_DATA_IN_PIN = 23;

constexpr i2s_port_t SPEAK_I2S_NUMBER = I2S_NUM_0;
constexpr int MODE_MIC = 0;
constexpr int MODE_SPK = 1;
constexpr int I2S_SAMPLE_RATE = 8000;
constexpr int I2S_BUFFER_COUNT = 4;
constexpr int I2S_BUFFER_SIZE = 1000;

uint8_t buffer[I2S_BUFFER_SIZE];
size_t transBytes;
int16_t previous_x = 0;
int16_t previous_y = 0;
int16_t tmp_x;

// === Multi Core === //
TaskHandle_t i2sTaskHandle = NULL;

// === ROS === //
// ros::NodeHandle_<ArduinoHardware, 25, 25, 1024, 1024> nh;
ros::NodeHandle_<ArduinoHardware, 25, 25, 2048, 2048> nh;
// ros::NodeHandle_<ArduinoHardware, 25, 25, 4096, 4096> nh;
audio_common_msgs::AudioData audio_msg;
ros::Publisher pub_audio("/audio", &audio_msg);
std_msgs::UInt16 num_msg;
ros::Publisher pub_num("/num", &num_msg);

class RingBuffer {
public:
    RingBuffer(int size) : size(size), readIdx(0), writeIdx(0) {
        buffer = new int8_t[size];
    }

    ~RingBuffer() {
        delete[] buffer;
    }

    int available() const {
        int diff = writeIdx - readIdx;
        if (diff >= 0) return diff;
        return size + diff;
    }

    void write(int8_t value) {
        buffer[writeIdx] = value;
        writeIdx = (writeIdx + 1) % size;
    }

    int8_t read() {
        int8_t value = buffer[readIdx];
        readIdx = (readIdx + 1) % size;
        return value;
    }

private:
    int8_t* buffer;
    int size;
    volatile int readIdx;
    volatile int writeIdx;
};

RingBuffer ringBuffer(I2S_BUFFER_SIZE * 8);

bool InitI2SSpeakOrMic(int mode) {
    esp_err_t err = ESP_OK;

    i2s_driver_uninstall(SPEAK_I2S_NUMBER);
    i2s_config_t i2s_config = {
        .mode = (i2s_mode_t)(I2S_MODE_MASTER),
        .sample_rate = I2S_SAMPLE_RATE,
        .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,  // fixed at 12bit, stereo, MSB
        .channel_format = I2S_CHANNEL_FMT_ALL_LEFT,
        .communication_format = I2S_COMM_FORMAT_I2S,
        .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
        .dma_buf_count = I2S_BUFFER_COUNT,
        .dma_buf_len = I2S_BUFFER_SIZE,
        .use_apll = false,
        .tx_desc_auto_clear = false,
        .fixed_mclk = 0};
    if (mode == MODE_MIC) {
        i2s_config.mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_RX | I2S_MODE_PDM);
    } else {
        i2s_config.mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_TX);
        i2s_config.tx_desc_auto_clear = true;
    }

    err += i2s_driver_install(SPEAK_I2S_NUMBER, &i2s_config, 0, NULL);
    i2s_pin_config_t tx_pin_config;

#if (ESP_IDF_VERSION > ESP_IDF_VERSION_VAL(4, 3, 0))
    tx_pin_config.mck_io_num = I2S_PIN_NO_CHANGE;
#endif

    tx_pin_config.bck_io_num = CONFIG_I2S_BCK_PIN;
    tx_pin_config.ws_io_num = CONFIG_I2S_LRCK_PIN;
    tx_pin_config.data_out_num = CONFIG_I2S_DATA_PIN;
    tx_pin_config.data_in_num = CONFIG_I2S_DATA_IN_PIN;
    err += i2s_set_pin(SPEAK_I2S_NUMBER, &tx_pin_config);
    err += i2s_set_clk(SPEAK_I2S_NUMBER, I2S_SAMPLE_RATE, I2S_BITS_PER_SAMPLE_16BIT,
                       I2S_CHANNEL_MONO);
    return true;
}

void requestEvent();
void receiveEvent(int howMany);

void i2sTask(void* parameter) {
    while (1) {
        i2s_read(I2S_NUM_0, (char*)buffer, I2S_BUFFER_SIZE, &transBytes, portMAX_DELAY);
        for (int i = 0; i < transBytes; i += 2) {
            uint16_t* val = (uint16_t*)&buffer[i];

            // Process the 12-bit audio sample, adjust and scale it to 16-bit range
            int16_t p = (((0x0fff - (*val & 0x0fff)) * 16) - 0x8000);
            int16_t tmp_x = p;

            /* https://stackoverflow.com/questions/77383602/do-these-two-dc-filter-algorithms-achieve-the-same-thing-and-is-one-better */
            /* apply DC filter */
            p = p - previous_x + 0.995 * previous_y;
            previous_y = p;
            previous_x = tmp_x;

            // Scale the result down to fit into an 8-bit signed integer by right-shifting 8 bits
            p = p >> 8;
            ringBuffer.write((uint8_t)p);
        }
    }
}

void setup() {
    M5.begin(true, false, true);
    M5.dis.clear();
    M5.dis.drawpix(0, CRGB(255, 255, 0));
    InitI2SSpeakOrMic(MODE_MIC);
    xTaskCreate(i2sTask, "i2sTask", 2048, NULL, 0, &i2sTaskHandle);

    // === Ros === //
    nh.initNode();
    nh.advertise(pub_audio);
    nh.advertise(pub_num);
    while(!nh.connected())
    {
      nh.spinOnce();
      M5.dis.drawpix(0, CRGB(0, 255, 0));
      delay(100);
      M5.dis.drawpix(0, CRGB(0, 0, 0));
      delay(100);
    }

    M5.dis.drawpix(0, CRGB(255, 255, 255));
    delay(1000);
}

void loop() {
    // === ROS Connection Check === //
    if (!nh.connected())
    {
      while(!nh.connected())
      {
        nh.spinOnce();
        M5.dis.drawpix(0, CRGB(255, 0, 0));
        delay(50);
        M5.dis.drawpix(0, CRGB(0, 0, 0));
        delay(50);
      }
      M5.dis.drawpix(0, CRGB(255, 255, 255));
    }

    int data_num = ringBuffer.available();
    if(data_num > 0) {
        uint8_t audio_data[data_num*2];
        for(int k = 0; k < data_num*2; k+=2) {
            int8_t value = ringBuffer.read();
            int16_t shifted = value * 256;
            uint8_t high = (uint8_t)((shifted >> 8) & 0xFF);
            uint8_t low = (uint8_t)(shifted & 0xFF);
            audio_data[k] = low;
            audio_data[k+1] = high;
        }

        // === Publish Audio Data === //
        audio_msg.data_length = data_num*2;
        audio_msg.data = audio_data;
        // pub_audio.publish(&audio_msg);

        num_msg.data = data_num * 2;
        pub_num.publish(&num_msg);
    }

    // // === Publish Audio Data === //
    // uint8_t audio_data[1] = {1};
    // audio_msg.data_length = 1;
    // audio_msg.data = audio_data;
    // pub_audio.publish(&audio_msg);

    nh.spinOnce();
    delay(1);
}

