#define ROSSERIAL_ARDUINO_BLUETOOTH // set this if you use rosserial over bluetooth

#include <Arduino.h>
#include <ros.h>
#include <std_msgs/String.h>
#include <LCDFace.h>


// LCD Face //
LiquidCrystal_I2C lcd(0x27, 16, 2);
LCDFace face;


// ROS
ros::NodeHandle nh;

// Publisher
std_msgs::String hello_msg;
ros::Publisher pub_hello("chatter", &hello_msg);


void setup()
{
    // LCD Face //
    face.init(&lcd);

    // ROS //
    nh.initNode();
    nh.advertise(pub_hello);
}

void loop()
{
    hello_msg.data = "hello world!";
    pub_hello.publish(&hello_msg);
    nh.spinOnce();
    delay(10);
}