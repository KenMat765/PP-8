#include "SR04.h"
#include <ros.h>
#include <std_msgs/Int64.h>
#include <ESP8266WiFi.h>

#define LEDPIN 16


// === UltraSonic sensor === //
#define TRIG_PIN 13
#define ECHO_PIN 12
SR04 sr04 = SR04(ECHO_PIN, TRIG_PIN);


// === Wifi === //
const char SSID[] = "JSK300";
const char PASSWORD[] = "89sk389sk3";
IPAddress server(192, 168, 97, 47);
const uint16_t serverPort = 11413;
WiFiClient client;

class WiFiHardware {
public:
  WiFiHardware(){};

  void init() {
    client.connect(server, serverPort);
  }

  int read() {
    return client.read();
  }

  void write(uint8_t *data, int length) {
    for (int i = 0; i < length; i++) {
      client.write(data[i]);
    }
  }

  unsigned long time() {
    return millis();
  }
};


// === ROS === //
ros::NodeHandle_<WiFiHardware> nh;
std_msgs::Int64 distance_msg;
ros::Publisher chatter("right_arm/ultrasonic_sensor", &distance_msg);

void setup()
{
  // === LED === //
  pinMode(LEDPIN, OUTPUT);
  digitalWrite(LEDPIN, LOW);


  // === WiFi === //
  Serial.begin(115200);
  WiFi.begin(SSID, PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    digitalWrite(LEDPIN, LOW);
    delay(500);
    digitalWrite(LEDPIN, HIGH);
    delay(500);
  }


  // === ROS === //
  nh.initNode();
  nh.advertise(chatter);
  while (!nh.connected()) {
    nh.spinOnce();
    digitalWrite(LEDPIN, LOW);
    delay(250);
    digitalWrite(LEDPIN, HIGH);
    delay(250);
  }


  // === Ready to go === //
  digitalWrite(LEDPIN, HIGH);
}

void loop()
{
  // === WiFi Connection Check === //
  while (WiFi.status() != WL_CONNECTED)
  {
    WiFi.disconnect();
    WiFi.reconnect();
    digitalWrite(LEDPIN, LOW);
    delay(500);
    digitalWrite(LEDPIN, HIGH);
    delay(500);
  }


  // === ROS Connection Check === //
  while (!nh.connected())
  {
    nh.spinOnce();
    digitalWrite(LEDPIN, LOW);
    delay(250);
    digitalWrite(LEDPIN, HIGH);
    delay(250);
  }


  long dist = sr04.Distance();
  distance_msg.data = dist;
  chatter.publish(&distance_msg);
  nh.spinOnce();

  delay(100);
}
