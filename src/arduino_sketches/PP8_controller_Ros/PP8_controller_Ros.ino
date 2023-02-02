#include <IcsHardSerialClass.h>
#include <MPU6050.h>
#include <LCDFace.h>
#include <WiFi.h>
#include <ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/String.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Empty.h>
#include <std_msgs/Bool.h>

// Horizontal Controll
bool hor_controll = false;
double dt, prev_millis_arm;
double tilt_z, prev_tilt_z;
float reset_timer;

// Gyro //
MPU6050 mpu;
float acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z;

// LCD Face //
LiquidCrystal_I2C lcd(0x27, 16, 2);
LCDFace face;
unsigned long prev_millis_face = 0, blink_interval;

// Servo //
#define LEFT_WHEEL_ID 0
#define RIGHT_WHEEL_ID 1
#define RIGHT_ARM_ID 2
#define LEFT_ARM_ID 3
const byte EN_PIN = 23;
const long BAUDRATE = 115200;
const int TIMEOUT = 1000;
IcsHardSerialClass krs(&Serial, EN_PIN, BAUDRATE, TIMEOUT);
int max_vel = 4000, max_pos = 4000;

// Wifi
// const char SSID[] = "JSK300";
// const char PASSWORD[] = "89sk389sk3";
// IPAddress server(192, 168, 97, 106);
const char SSID[] = "Ken's iPhone";
const char PASSWORD[] = "8z73ehz8qnjqm";
IPAddress server(172, 20, 10, 8);
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
// Publisher
std_msgs::Float32MultiArray mpu_msg;
ros::Publisher pub_mpu("mpu6050", &mpu_msg);
// Subscriber
float mpu_data[6];
void wheel_cb(const std_msgs::Float32MultiArray &msg)
{
    int l_vel = (int)(msg.data[0] * max_vel);
    int r_vel = (int)(msg.data[1] * max_vel);
    SetWheelVel(l_vel, r_vel);
}
void arm_cb(const std_msgs::Float32MultiArray &msg)
{
    if (hor_controll)
        return;
    int l_pos = (int)(msg.data[0] * max_pos);
    int r_pos = (int)(msg.data[1] * max_pos);
    SetArmPos(l_pos, r_pos);
}
void display_cb(const std_msgs::String &msg)
{
    if (hor_controll)
        return;
    String hello = "hello";
    String good_night = "good night";
    if (hello.equals(msg.data))
        face.ShowFace(LCDFace::HAPPY_EYE);
    else if (good_night.equals(msg.data))
        face.ShowFace(LCDFace::SLEEPY_EYE);
    else
        face.Display(msg.data, 0, 0, true);
    delay(2000);
    face.ShowFace(LCDFace::NORMAL_EYE);
}
void status_vel_cb(const std_msgs::UInt16 &msg)
{
    max_vel = msg.data;
    if (!hor_controll)
    {
        face.Display("Maximum vel", 0, 0, true);
        face.Display("set to : " + String(max_vel), 0, 1, false);
        delay(2000);
        face.ShowFace(LCDFace::NORMAL_EYE);
    }
}
void status_arm_cb(const std_msgs::UInt16 &msg)
{
    max_pos = msg.data;
    if (!hor_controll)
    {
        face.Display("Maximum pos", 0, 0, true);
        face.Display("set to : " + String(max_pos), 0, 1, false);
        delay(2000);
        face.ShowFace(LCDFace::NORMAL_EYE);
    }
}
void init_arm_cb(const std_msgs::Empty &msg)
{
    dt = 0.0;
    tilt_z = 0.0;
    prev_tilt_z = 0.0;
    reset_timer = 0.0;
    prev_millis_arm = millis();
    SetArmPos(0, 0);
}
void ctrl_arm_cb(const std_msgs::Bool &msg)
{
    hor_controll = msg.data;
    if (hor_controll)
        face.Display("Arm Controll ON", 0, 0, true);
    else
        face.ShowFace(LCDFace::NORMAL_EYE);
}
ros::Subscriber<std_msgs::Float32MultiArray> sub_wheel("/servo/wheel_vel", &wheel_cb);
ros::Subscriber<std_msgs::Float32MultiArray> sub_arm("/servo/arm_pos", &arm_cb);
ros::Subscriber<std_msgs::String> sub_display("/lcd_display", &display_cb);
ros::Subscriber<std_msgs::UInt16> sub_status_vel("/status/max_vel", &status_vel_cb);
ros::Subscriber<std_msgs::UInt16> sub_status_pos("/status/max_pos", &status_arm_cb);
ros::Subscriber<std_msgs::Empty> sub_init_arm("/controll/init_arm", &init_arm_cb);
ros::Subscriber<std_msgs::Bool> sub_ctrl_arm("/controll/ctrl_arm", &ctrl_arm_cb);

void SetWheelVel(int l_vel, int r_vel)
{
    krs.setPos(LEFT_WHEEL_ID, 7500 + l_vel);
    krs.setPos(RIGHT_WHEEL_ID, 7500 - r_vel);
}

void SetArmPos(int l_pos, int r_pos)
{
    krs.setPos(LEFT_ARM_ID, 7500 - l_pos);
    krs.setPos(RIGHT_ARM_ID, 7500 + r_pos);
}

void setup()
{
    Serial.begin(115200);

    // Gyro //
    mpu.begin(3, 1000);

    // LCD Face //
    face.init(&lcd);
    blink_interval = random(2000, 5000);

    // Servo //
    krs.begin();

    // WiFi
    WiFi.begin(SSID, PASSWORD);
    face.Display("Wifi...", 0, 0, true);
    while (WiFi.status() != WL_CONNECTED)
        delay(1000);
    face.Display("Wifi Connected", 0, 0, true);

    // Ros //
    nh.initNode();
    nh.advertise(pub_mpu);
    nh.subscribe(sub_wheel);
    nh.subscribe(sub_arm);
    nh.subscribe(sub_display);
    nh.subscribe(sub_status_vel);
    nh.subscribe(sub_status_pos);
    nh.subscribe(sub_init_arm);
    nh.subscribe(sub_ctrl_arm);

    delay(2000);

    face.ShowFace(LCDFace::NORMAL_EYE);
}

void loop()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        face.Display("No Connection", 0, 0, true);
        delay(1000);
        return;
    }

    // Calculate Current Tilt.
    mpu.SetData();
    mpu.GetData(&mpu_data[0], &mpu_data[1], &mpu_data[2],
                &mpu_data[3], &mpu_data[4], &mpu_data[5]);
    dt = (millis() - prev_millis_arm) / 1000;
    if (abs(mpu_data[5]) > 1.0)
        tilt_z += mpu_data[5] * dt;
    prev_millis_arm = millis();
    double d_tilt_z = tilt_z - prev_tilt_z;
    reset_timer = (d_tilt_z <= 0.001 && tilt_z < 10.0) ? reset_timer + dt : 0.0;
    if (reset_timer >= 1.0)
    {
        tilt_z = 0.0;
        reset_timer = 0.0;
    }
    prev_tilt_z = tilt_z;

    if (hor_controll)
        SetArmPos(-tilt_z * 4000 / 135, -tilt_z * 4000 / 135);
    else
    {
        // Blink Eyes.
        unsigned long curr_millis_face = millis();
        if (curr_millis_face - prev_millis_face > blink_interval)
        {
            prev_millis_face = curr_millis_face;
            blink_interval = random(2000, 5000);
            face.BlinkEyes(300);
            delay(200);
            face.BlinkEyes(300);
        }
    }

    mpu_msg.data_length = 6;
    mpu_msg.data = mpu_data;
    pub_mpu.publish(&mpu_msg);
    nh.spinOnce();
}
