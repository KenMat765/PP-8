#include <ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <WiFi.h>
#include <Wire.h>

// $ rosrun rosserial_python serial_node.py _baud:=115200 tcp

// Gyro //
const uint8_t GYRO_ADDRESS = 0x68;
float ax, ay, az, gx, gy, gz;
float gyro_data[6];

void GetGyro()
{
    Wire.beginTransmission(GYRO_ADDRESS);
    Wire.write(0x3B);
    Wire.endTransmission(false);
    Wire.requestFrom(GYRO_ADDRESS, 14, true);
    ax = (float)((Wire.read() << 8 | Wire.read()) / 16384.0);
    ay = (float)((Wire.read() << 8 | Wire.read()) / 16384.0);
    az = (float)((Wire.read() << 8 | Wire.read()) / 16384.0);
    int16_t Temp = Wire.read() << 8 | Wire.read();
    gx = (float)((Wire.read() << 8 | Wire.read()) / 131.0);
    gy = (float)((Wire.read() << 8 | Wire.read()) / 131.0);
    gz = (float)((Wire.read() << 8 | Wire.read()) / 131.0);
}

// Wifi
const char SSID[] = "JSK300";
const char PASSWORD[] = "89sk389sk3";
IPAddress server(192, 168, 97, 106);
const uint16_t serverPort = 11411;
WiFiClient client;

class WiFiHardware
{
public:
    WiFiHardware(){};

    void init()
    {
        client.connect(server, serverPort);
    }

    int read()
    {
        return client.read();
    }

    void write(uint8_t *data, int length)
    {
        for (int i = 0; i < length; i++)
        {
            client.write(data[i]);
        }
    }

    unsigned long time()
    {
        return millis();
    }
};

// ROS
ros::NodeHandle_<WiFiHardware> nh;
std_msgs::Float32MultiArray gyro_msg;
ros::Publisher gyro("gyro", &gyro_msg);

void setup()
{
    // Gyro //
    Wire.begin();

    // WiFi
    Serial.begin(115200);
    WiFi.begin(SSID, PASSWORD);
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(1000);
    }
    Serial.println("WiFi Connected!!");

    // ROS
    nh.initNode();
    nh.advertise(gyro);
    delay(10);
}

void loop()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        Serial.println("Not Connected");
        return;
    }

    GetGyro();

    gyro_data[0] = ax;
    gyro_data[1] = ay;
    gyro_data[2] = az;
    gyro_data[3] = gx;
    gyro_data[4] = gy;
    gyro_data[5] = gz;

    gyro_msg.data_length = 6; // これがないとdataが入らない.
    gyro_msg.data = gyro_data;
    gyro.publish(&gyro_msg);
    nh.spinOnce();

    Serial.print(gx);

    delay(1000);
}
