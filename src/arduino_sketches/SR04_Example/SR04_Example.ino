#include "SR04.h"
#include <ros.h>
#include <std_msgs/Float64.h>
#include <ESP8266WiFi.h>

#define LEDPIN 16

// UltraSonic sensor
#define TRIG_PIN 13
#define ECHO_PIN 12
SR04 sr04 = SR04(ECHO_PIN, TRIG_PIN);
long a;

// Wifi
// const char SSID[] = "JSK300";
// const char PASSWORD[] = "89sk389sk3";
const char SSID[] = "Ken's iPhone";
const char PASSWORD[] = "8z73ehz8qnjqm";
// IPAddress server(192, 168, 97, 106);
IPAddress server(172, 20, 10, 8);
const uint16_t serverPort = 11413;
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
std_msgs::Float64 distance_msg;
ros::Publisher chatter("right_arm/ultrasonic_sensor", &distance_msg);

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

   a = sr04.Distance();
   Serial.print(a);
   Serial.println("cm");

   distance_msg.data = a;
   chatter.publish(&distance_msg);
   Serial.println("Published");
   nh.spinOnce();
   delay(1000);
}
