#include <ros.h>
#include <std_msgs/String.h>
#include <ESP8266WiFi.h>

#define LEDPIN 16

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
ros::Publisher chatter("right_arm/ultrasonic_sensor", &str_msg);

char hello[13] = "hello world!";

void setup()
{
    pinMode(LEDPIN, OUTPUT);
    digitalWrite(LEDPIN, LOW);

    // WiFi
    Serial.begin(115200);
    WiFi.begin(SSID, PASSWORD);
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        digitalWrite(LEDPIN, LOW);
        delay(500);
        digitalWrite(LEDPIN, HIGH);
        delay(500);
    }
    Serial.println("WiFi Connected!!");
    digitalWrite(LEDPIN, HIGH);

    // ROS
    nh.initNode();
    nh.advertise(chatter);
    delay(2000);
}

void loop()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        digitalWrite(LEDPIN, LOW);
        Serial.println("Not Connected");
        delay(1000);
        return;
    }

    digitalWrite(LEDPIN, HIGH);
    str_msg.data = hello;
    chatter.publish(&str_msg);
    Serial.println("Published");
    nh.spinOnce();
    delay(1000);
}
