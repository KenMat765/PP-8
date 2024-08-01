#define CAMERA_MODEL_AI_THINKER
#define ROSSERIAL_ARDUINO_BLUETOOTH

#include "esp_camera.h"
#include "camera_pins.h"
#include <ros.h>
#include <sensor_msgs/CompressedImage.h>


// === ROS === //
ros::NodeHandle_<ArduinoHardware, 25, 25, 8192, 8192> nh;
sensor_msgs::CompressedImage camera_msg;
ros::Publisher pub_cam("right_arm/image_raw/compressed", &camera_msg);


void setup()
{
  // === Serial Settings === //
  // Serial.begin(115200);


  // === LED Settings === //
  pinMode(LED_GPIO_NUM, OUTPUT);
  digitalWrite(LED_GPIO_NUM, LOW);


  // === Camera Configuration === //
  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;

  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sscb_sda = SIOD_GPIO_NUM;
  config.pin_sscb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;

  config.xclk_freq_hz = 20000000;
  config.frame_size = FRAMESIZE_QQVGA;
  // config.pixel_format = PIXFORMAT_JPEG; // for streaming
  // config.pixel_format = PIXFORMAT_RGB565; // for face detection/recognition
  config.pixel_format = PIXFORMAT_GRAYSCALE; // for face detection/recognition
  config.grab_mode = CAMERA_GRAB_WHEN_EMPTY;
  config.fb_location = CAMERA_FB_IN_PSRAM;
  config.jpeg_quality = 100;
  config.fb_count = 1;

  if (psramFound())
  {
    // Serial.println("PSRAM Found");
    config.fb_count = 2;
    config.grab_mode = CAMERA_GRAB_LATEST;
  }


  // === Camera Initialization === //
  esp_err_t err = esp_camera_init(&config);
  if (err != ESP_OK)
  {
    // Serial.printf("Camera initialization failed with error 0x%x.\n", err);
    return;
  }


  // === Ros === //
  // Serial.println("Connecting BT ...");
  
  nh.initNode();
  nh.advertise(pub_cam);
  while(!nh.connected())
  {
    nh.spinOnce();
    digitalWrite(LED_GPIO_NUM, LOW);
    delay(250);
    digitalWrite(LED_GPIO_NUM, HIGH);
    delay(250);
  }
  digitalWrite(LED_GPIO_NUM, LOW);

  // Serial.println("Connected !!");
}


void loop()
{
  // === ROS Connection Check === //
  if (!nh.connected())
  {
    // Serial.println("Connection Lost");
    while(!nh.connected())
    {
      nh.spinOnce();
      digitalWrite(LED_GPIO_NUM, LOW);
      delay(250);
      digitalWrite(LED_GPIO_NUM, HIGH);
      delay(250);
    }
    digitalWrite(LED_GPIO_NUM, LOW);
    // Serial.println("Reconnected !!");
  }


  // === Get frame buffer data === //
  camera_fb_t* fb = NULL;
  fb = esp_camera_fb_get();
  if(!fb)
  {
    // Serial.println("Camera capture failed");
    delay(1000);
    return;
  }
  
  else
  {
    // === Print camera_fb_t data === //
    // Serial.println("");
    // Serial.print("buf : ");
    // Serial.println(*fb->buf);
    // Serial.print("len : ");
    // Serial.println(fb->len);
    // Serial.print("height : ");
    // Serial.println(fb->height);
    // Serial.print("width : ");
    // Serial.println(fb->width);
    // Serial.print("format : ");
    // Serial.println(fb->format);
    // Serial.print("timestamp : ");
    // Serial.println(fb->timestamp.tv_sec);
  }

 
  // === Publish image data === //
  size_t buf_len = fb->len;
  uint8_t image_data[buf_len];
  for (uint32_t k = 0; k < buf_len; k++)
  {
    uint8_t pixel_data = *(fb->buf + k);
    image_data[k] = pixel_data;
  }
  camera_msg.format = "jpeg";
  camera_msg.data = image_data;
  camera_msg.data_length = buf_len;
  pub_cam.publish(&camera_msg);


  // === ROS Spin === //
  nh.spinOnce();


  // === Return frame buffer === //
  esp_camera_fb_return(fb);
}
