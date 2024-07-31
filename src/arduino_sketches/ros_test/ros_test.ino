// 
#define ROSSERIAL_ARDUINO_TCP
// 

#include <ros.h>
#include <std_msgs/String.h>
#include <WiFi.h>

// Wifi
const char SSID[] = "JSK300";
const char PASSWORD[] = "89sk389sk3";
IPAddress server(192, 168, 97, 47);
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
// ros::NodeHandle_<WiFiHardware> nh;

// 
ros::NodeHandle nh;
// 

std_msgs::String str_msg;
ros::Publisher chatter("chatter", &str_msg);

char hello[13] = "hello world!";

void setup()
{
    // Serial.begin(115200);
    // while(!Serial);

    // WiFi
    WiFi.begin(SSID, PASSWORD);
    while (WiFi.status() != WL_CONNECTED)
    {
        // Serial.print(".");
        delay(1000);
    }
    // Serial.println("WiFi Connected!!");

    // ROS
    
    // 
    nh.getHardware()->setConnection(server, serverPort);
    // 

    nh.initNode();
    nh.advertise(chatter);
}

void loop()
{
  // Check WiFi connection.
    if (WiFi.status() != WL_CONNECTED)
    {
        // Serial.println("No WiFi");
        nh.spinOnce();
        nh.logerror("No WiFi");
        delay(10);
        return;
    }

    // Check ROS connection.
    if (!nh.connected())
    {
      // Serial.println("No ROS");
      nh.spinOnce();
      nh.logwarn("No ROS");
      delay(10);
      return;
    }

    str_msg.data = hello;
    chatter.publish(&str_msg);
    // Serial.println("Published");
    nh.spinOnce();
}
