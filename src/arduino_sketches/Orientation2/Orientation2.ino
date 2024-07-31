#include "I2Cdev.h"
#include "MPU6050.h"
#include "Wire.h"
#include "MadgwickAHRS.h"

MPU6050 mpu;
float acc_gyro[6];
float ypr[3];
float ypr_drift[3];

Madgwick m_filter;

unsigned long prev_time = 0;
unsigned long ypr_reset_counter[3];

void setup()
{
    Wire.begin();
    
    Serial.begin(115200);
    while (!Serial);

    mpu.initialize();
    mpu.setXGyroOffset(-6189);
    mpu.setYGyroOffset(526);
    mpu.setZGyroOffset(2757);
    mpu.setXAccelOffset(71);
    mpu.setYAccelOffset(-24);
    mpu.setZAccelOffset(-17);
    mpu.CalibrateAccel(6);
    mpu.CalibrateGyro(6);

    delay(100);
    
    m_filter.begin(100); // Hz

    delay(100);

    prev_time = micros()/1000000;
}

void loop()
{
    int16_t acc_gyro_raw[6];
    mpu.getMotion6(&acc_gyro_raw[0], &acc_gyro_raw[1], &acc_gyro_raw[2], &acc_gyro_raw[3], &acc_gyro_raw[4], &acc_gyro_raw[5]);

    for(int k = 0; k < 6; k++)
    {
      acc_gyro[k] = acc_gyro_raw[k] / ((k < 3) ? 16384.0 : 131.0);
    }

    // const float acc_thresh = 0.1;
    const float gyro_thresh = 1.0;
    // ax = (abs(ax) < acc_thresh) ? 0.0 : ax;
    // ay = (abs(ay) < acc_thresh) ? 0.0 : ay;
    // az = (abs(az) < acc_thresh) ? 0.0 : az;
    acc_gyro[3] = (abs(acc_gyro[3]) < gyro_thresh) ? 0.0 : acc_gyro[3];
    acc_gyro[4] = (abs(acc_gyro[4]) < gyro_thresh) ? 0.0 : acc_gyro[4];
    acc_gyro[5] = (abs(acc_gyro[5]) < gyro_thresh) ? 0.0 : acc_gyro[5];

    // Serial.print(ax);
    // Serial.print(",");
    // Serial.print(ay);
    // Serial.print(",");
    // Serial.print(az);
    // Serial.print(",");
    // Serial.print(gx);
    // Serial.print(",");
    // Serial.print(gy);
    // Serial.print(",");
    // Serial.println(gz);

    m_filter.updateIMU(acc_gyro[3], acc_gyro[4], acc_gyro[5], acc_gyro[0], acc_gyro[1], acc_gyro[2]);
    ypr[0] = m_filter.getYaw() - 180;
    ypr[1] = m_filter.getPitch();
    ypr[2] = m_filter.getRoll();

    const unsigned long reset_time = 1.0;
    const float thresh_angle = 3.0;
    unsigned long dt = micros()/1000000 - prev_time;
    prev_time = micros()/1000000;

    for(int k = 0; k < 3; k++)
    {
      ypr_reset_counter[k] = (abs(ypr[k]) < thresh_angle) ? ypr_reset_counter[k] + dt : 0.0;
      if(ypr_reset_counter[k] > reset_time) ypr_drift[k] = ypr[k];
    }

    Serial.print(ypr[0] - ypr_drift[0]);
    Serial.print(",");
    Serial.print(ypr[1] - ypr_drift[1]);
    Serial.print(",");
    Serial.println(ypr[2] - ypr_drift[2]);

    delay(10);
}