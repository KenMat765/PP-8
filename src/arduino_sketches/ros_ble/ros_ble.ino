#include <BluetoothSerial.h>
#include <ros.h>
#include <std_msgs/String.h>
#include <LCDFace.h>


// LCD Face //
LiquidCrystal_I2C lcd(0x27, 16, 2);
LCDFace face;


// Bluetooth
// String remoteName = "mech-user";
uint8_t address[6] = {0x04, 0xED, 0x33, 0x8D, 0xF6, 0xCF};
BluetoothSerial serialBT;

class BTHardware {
public:
  BTHardware(){}

  void init()
  {
    // serialBT.connect(remoteName);
    // serialBT.connect(address);
  }

  int read()
  {
    return serialBT.read();
  }

  void write(uint8_t *data, int length)
  {
    for (int i = 0; i < length; i++)
    {
        serialBT.write(data[i]);
    }
  }

  unsigned long time()
  {
    return millis();
  }
};


// ROS
ros::NodeHandle_<BTHardware> nh;

// Publisher
std_msgs::String hello_msg;
ros::Publisher pub_hello("chatter", &hello_msg);


void setup()
{
    // LCD Face //
    face.init(&lcd);


    // Bluetooth //
    serialBT.begin("ESP32-BT-demo");
    face.Display("Begining BT", 0, 0, true);
    bool connected = serialBT.connect(address);

    if (connected)
    {
        face.Display("Connected Succesfully!", 0, 0, true);
    }
    else
    {
        while (!serialBT.connected(10000))
        {
            face.Display("Failed to connect. retry ...", 0, 0, true);
            delay(1000);
        }
    }

    face.Display("Bluetooth ready.", 0, 0, true);

    // ROS //
    nh.initNode();
    nh.advertise(pub_hello);
}

void loop()
{
    if(!serialBT.available())
    {
        face.Display("Not available", 0, 0, true);
        delay(10);
        return;
    }

    hello_msg.data = "hello world!";
    pub_hello.publish(&hello_msg);
    nh.spinOnce();
    face.Display("Send", 0, 0, true);
}