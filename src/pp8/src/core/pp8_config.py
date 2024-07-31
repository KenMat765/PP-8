SERVO_RANGE = 4000
SERVO_CENTER = 7500
SERVO_MAX = 11500
SERVO_MIN = 3500

def angleEncoder(angle):
    angle_range = 135
    encoded_angle = SERVO_CENTER + (angle * SERVO_RANGE / angle_range)
    return encoded_angle