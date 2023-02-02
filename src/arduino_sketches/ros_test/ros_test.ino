#include <ros.h>
#include <std_msgs/String.h>
#include <WiFi.h>

// Wifi
const char SSID[] = "JSK300";
const char PASSWORD[] = "89sk389sk3";
IPAddress server(192, 168, 97, 106);
const uint16_t serverPort = 11412;
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
std_msgs::String str_msg;
ros::Publisher chatter("chatter", &str_msg);

char hello[13] = "hello world!";

void setup()
{
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
    nh.advertise(chatter);
    delay(10);
}

void loop()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        Serial.println("Not Connected");
        delay(1000);
        return;
    }

    str_msg.data = hello;
    chatter.publish(&str_msg);
    Serial.println("Published");
    nh.spinOnce();
    delay(1000);
}
