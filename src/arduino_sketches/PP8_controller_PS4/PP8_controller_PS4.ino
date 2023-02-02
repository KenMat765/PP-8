#include <PS4Controller.h>
#include <IcsHardSerialClass.h>
#include <MPU6050.h>
#include <LCDFace.h>

// Gyro //
MPU6050 mpu;
float acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z;

// LCD Face //
LiquidCrystal_I2C lcd(0x27, 16, 2);
LCDFace face;
unsigned long prev_millis_face, blink_interval;

// PS4 //
#define STICK_RANGE 128
const int THRESH = 30;

// Servo //
#define LEFT_WHEEL_ID 0
#define RIGHT_WHEEL_ID 1
#define RIGHT_ARM_ID 2
#define LEFT_ARM_ID 3

enum LR
{
    RIGHT,
    LEFT,
    BOTH
};

const byte EN_PIN = 23;
const long BAUDRATE = 115200;
const int TIMEOUT = 1000;
IcsHardSerialClass krs(&Serial, EN_PIN, BAUDRATE, TIMEOUT);

int vel_range = 4000;
int cur_l_vel, cur_r_vel;
bool l_break, r_break;

const int POS_RANGE = 4000;
int cur_l_pos, cur_r_pos;

// Horizontal Controll
bool hor_controll = false;
double dt, prev_millis_arm;
double tilt_z, prev_tilt_z;
float reset_timer;

void UpdateWheel(LR lr)
{
    switch (lr)
    {
    case LEFT:
        if (PS4.LStickY())
        {
            if (abs(PS4.LStickY()) < THRESH)
            {
                cur_l_vel = 0;
            }
            else
            {
                float n_lstick_y = PS4.LStickY() / (float)STICK_RANGE;
                cur_l_vel = (int)(n_lstick_y * vel_range);
            }
        }
        break;

    case RIGHT:
        if (PS4.RStickY())
        {
            if (abs(PS4.RStickY()) < THRESH)
            {
                cur_r_vel = 0;
            }
            else
            {
                float n_rstick_y = PS4.RStickY() / (float)STICK_RANGE;
                cur_r_vel = (int)(n_rstick_y * vel_range);
            }
        }
        break;
    }
    SetWheelVel(cur_l_vel, cur_r_vel);
}

void UpdateArm(LR lr)
{
    switch (lr)
    {
    case LEFT:
        if (PS4.LStickY())
        {
            if (abs(PS4.LStickY()) < THRESH)
            {
                cur_l_pos = 0;
            }
            else
            {
                float n_lstick_y = PS4.LStickY() / (float)STICK_RANGE;
                cur_l_pos = (int)(n_lstick_y * POS_RANGE);
            }
        }
        break;

    case RIGHT:
        if (PS4.RStickY())
        {
            if (abs(PS4.RStickY()) < THRESH)
            {
                cur_r_pos = 0;
            }
            else
            {
                float n_rstick_y = PS4.RStickY() / (float)STICK_RANGE;
                cur_r_pos = (int)(n_rstick_y * POS_RANGE);
            }
        }
        break;
    }
    SetArmPos(cur_l_pos, cur_r_pos);
}

void HitBreak(LR lr = BOTH)
{
    switch (lr)
    {
    case LEFT:
        cur_l_vel = 0;
        l_break = true;
        break;

    case RIGHT:
        cur_r_vel = 0;
        r_break = true;
        break;

    default:
        cur_l_vel = 0;
        cur_r_vel = 0;
        l_break = true;
        r_break = true;
        break;
    }
    SetWheelVel(cur_l_vel, cur_r_vel);
}

void InitArms(LR lr = BOTH)
{
    switch (lr)
    {
    case LEFT:
        cur_l_pos = 0;
        break;

    case RIGHT:
        cur_r_pos = 0;
        break;

    default:
        cur_l_pos = 0;
        cur_r_pos = 0;
        break;
    }
    SetArmPos(cur_l_pos, cur_r_pos);
}

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
    face.ShowFace(LCDFace::SLEEPY_EYE);

    // PS4 //
    PS4.begin();

    // Servo //
    krs.begin();
}

void loop()
{
    if (!PS4.isConnected())
        return;

    // Initialize.
    if (PS4.Options())
    {
        // Horizontal Controll //
        dt = 0.0;
        tilt_z = 0.0;
        prev_tilt_z = 0.0;
        reset_timer = 0.0;
        prev_millis_arm = millis();

        HitBreak(BOTH);
        InitArms(BOTH);
        return;
    }

    mpu.SetData();
    mpu.GetData(&acc_x, &acc_y, &acc_z, &gyro_x, &gyro_y, &gyro_z);
    dt = (millis() - prev_millis_arm) / 1000;
    if (abs(gyro_z) > 1.0)
        tilt_z += gyro_z * dt;
    prev_millis_arm = millis();
    double d_tilt_z = tilt_z - prev_tilt_z;
    reset_timer = (d_tilt_z <= 0.001 && tilt_z < 10.0) ? reset_timer + dt : 0.0;
    if (reset_timer >= 1.0)
    {
        tilt_z = 0.0;
        reset_timer = 0.0;
    }
    prev_tilt_z = tilt_z;

    // Horizontal Controll
    if (PS4.Circle())
    {
        hor_controll = true;
        face.Display("Arm Controll ON", 0, 0, true);
    }
    else if (PS4.Cross())
    {
        hor_controll = false;
        face.ShowFace(LCDFace::NORMAL_EYE);
    }

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

    if (PS4.Up())
    {
        SetWheelVel(vel_range, vel_range);
        return;
    }
    else if (PS4.Down())
    {
        SetWheelVel(-vel_range, -vel_range);
        return;
    }
    else if (PS4.Left())
    {
        SetWheelVel(-vel_range, vel_range);
        return;
    }
    else if (PS4.Right())
    {
        SetWheelVel(vel_range, -vel_range);
        return;
    }

    if (PS4.L1())
        HitBreak(LEFT);
    else
        l_break = false;
    if (PS4.R1())
        HitBreak(RIGHT);
    else
        r_break = false;

    // Left.
    if (PS4.L2())
    {
        HitBreak(LEFT);
        if (!hor_controll)
            UpdateArm(LEFT);
    }
    else if (!l_break)
    {
        UpdateWheel(LEFT);
    }

    // Right.
    if (PS4.R2())
    {
        HitBreak(RIGHT);
        if (!hor_controll)
            UpdateArm(RIGHT);
    }
    else if (!r_break)
    {
        UpdateWheel(RIGHT);
    }
}
