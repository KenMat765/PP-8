#define ROSSERIAL_ARDUINO_BLUETOOTH
#include <PoseEstimation.h>
#include <IcsHardSerialClass.h>
#include <LCDFace.h>
#include <CoilSwitch.h>
#include <AquesTalk.h>

#include <ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <geometry_msgs/Vector3.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>


// === Pose Estimation === //
PoseEstimation pe;


// === LCD Face  === //
LCDFace face;


// === Servo === //
#define LEFT_WHEEL_ID 0
#define RIGHT_WHEEL_ID 1
#define RIGHT_ARM_ID 2
#define LEFT_ARM_ID 3
const byte EN_PIN = 23;
const long BAUDRATE = 115200;
const int TIMEOUT = 1000;
IcsHardSerialClass krs(&Serial, EN_PIN, BAUDRATE, TIMEOUT);
const uint8_t MAX_DEG = 135;
uint16_t max_vel = MAX_DEG, max_ang = MAX_DEG;
bool arm_ctrl = false;


// === Coil Switch === //
const uint8_t L_GATE_PIN = 18;
const uint8_t R_GATE_PIN = 33;
CoilSwitch coil_switch(L_GATE_PIN, R_GATE_PIN);


// === AquesTalk === //
const uint8_t PLAY_PIN = 26;
const uint8_t SLEEP_PIN = 15;
AquesTalk aqt(PLAY_PIN, SLEEP_PIN);


// === ROS === //
ros::NodeHandle nh;

// Publisher
std_msgs::Float32MultiArray mpu_msg;
geometry_msgs::Vector3 ypr_msg;
ros::Publisher pub_mpu("/acc_gyro", &mpu_msg);
ros::Publisher pub_ypr("/ypr", &ypr_msg);

// Subscriber
void arm_cb(const std_msgs::Float32MultiArray &msg)
{
  if (arm_ctrl)
  {
    nh.logwarn("Arm controll is currently running.");
    nh.logwarn("Could not set arm position.");
    return;
  }
  float l_ang = constrain(msg.data[0], -max_ang, max_ang);
  float r_ang = constrain(msg.data[1], -max_ang, max_ang) * -1;
  uint16_t l_pos = krs.degPos(l_ang);
  uint16_t r_pos = krs.degPos(r_ang);
  krs.setPos(LEFT_ARM_ID, l_pos);
  krs.setPos(RIGHT_ARM_ID, r_pos);
}

void arm_ctrl_cb(const std_msgs::Bool &msg)
{
  arm_ctrl = msg.data;
  if (arm_ctrl)
    nh.loginfo("Arm controll : ON");
  else
    nh.loginfo("Arm controll : OFF");
}

void display_cb(const std_msgs::String &msg)
{
  String face_mode = "face mode";
  if (face_mode.equals(msg.data))
    face.ShowFace(LCDFace::NORMAL_EYE);
  else
    face.Display(msg.data);
}

void speaker_cb(const std_msgs::String &msg)
{
  if (aqt.isTalking())
  {
    nh.logwarn("AquesTalk now busy.");
    return;
  }
  aqt.talk(msg.data);
}

ros::Subscriber<std_msgs::Float32MultiArray> sub_arm("/servo/arm_ang", &arm_cb);
ros::Subscriber<std_msgs::Bool> sub_arm_ctrl("/servo/arm_ctrl", &arm_ctrl_cb);
ros::Subscriber<std_msgs::String> sub_display("/display", &display_cb);
ros::Subscriber<std_msgs::String> sub_speaker("/speaker", &speaker_cb);



void setup()
{
  // === LCD Face === //
  face.begin(0x27, 16, 2);


  // === AquesTalk === //
  aqt.begin();
  aqt.sleep();


  // === Servo === //
  krs.begin();


  // === Ros === //
  nh.initNode();
  nh.advertise(pub_mpu);
  nh.advertise(pub_ypr);
  nh.subscribe(sub_arm);
  nh.subscribe(sub_arm_ctrl);
  nh.subscribe(sub_display);
  nh.subscribe(sub_speaker);

  while(!nh.connected())
  {
    nh.spinOnce();
    delay(10);
  }


  // === Pose Estimation === //
  pe.begin(-6164, 216, 2572, 72, -24, -20, 330);
  pe.reset();
  face.ShowFace();
}

void loop()
{
  // === ROS Connection Check === //
  if (!nh.connected())
  {
    face.Display("Connection Lost");
    while(!nh.connected())
    {
      nh.spinOnce();
      delay(10);
    }
    face.ShowFace();
    pe.reset();
  }

  
  // === Update Pose Estimation === //
  pe.update();


  // === Publish ACC & GYRO === //
  mpu_msg.data_length = 6;
  mpu_msg.data = pe.acc_gyro;
  pub_mpu.publish(&mpu_msg);


  // === Publish YPR === //
  ypr_msg.x = pe.ypr[0];
  ypr_msg.y = pe.ypr[1];
  ypr_msg.z = pe.ypr[2];
  pub_ypr.publish(&ypr_msg);


  // === Arm Controll === //
  if (arm_ctrl)
  {
    int h_pos = krs.degPos(pe.ypr[1]);
    int h_pos_inv = krs.degPos(-pe.ypr[1]);
    krs.setPos(LEFT_ARM_ID, h_pos);
    krs.setPos(RIGHT_ARM_ID, h_pos_inv);
  }


  // === ROS Spin === //
  nh.spinOnce();
}