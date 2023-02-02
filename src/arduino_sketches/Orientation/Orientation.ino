#include "MPU6050.h"
#include <IcsHardSerialClass.h>

MPU6050 mpu;
float ax, ay, az, gx, gy, gz;
double dt, prev;
double tilt_z, prev_tilt_z;
float reset_timer;

// Servo //
#define LEFT_WHEEL_ID 0
#define RIGHT_WHEEL_ID 1
#define RIGHT_ARM_ID 2
#define LEFT_ARM_ID 3
const byte EN_PIN = 23;
const long BAUDRATE = 115200;
const int TIMEOUT = 1000;
IcsHardSerialClass krs(&Serial, EN_PIN, BAUDRATE, TIMEOUT);

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
    mpu.begin(3, 1000);
    prev = millis();
    dt = 0.0;
    tilt_z = 0.0;
    prev_tilt_z = 0.0;
    reset_timer = 0.0;

    // Servo //
    krs.begin();

    delay(1000);
}

void loop()
{
    mpu.SetData();
    mpu.GetData(&ax, &ay, &az, &gx, &gy, &gz);

    dt = (millis() - prev) / 1000;
    if (abs(gz) > 1.0)
        tilt_z += gz * dt;
    prev = millis();

    Serial.println(tilt_z);

    double d_tilt_z = tilt_z - prev_tilt_z;
    reset_timer = (d_tilt_z <= 0.001 && tilt_z < 10.0) ? reset_timer + dt : 0.0;
    if (reset_timer >= 2.0)
    {
        tilt_z = 0.0;
        reset_timer = 0.0;
    }
    prev_tilt_z = tilt_z;

    SetArmPos(-tilt_z * 4000 / 135, -tilt_z * 4000 / 135);

    delay(10);
}