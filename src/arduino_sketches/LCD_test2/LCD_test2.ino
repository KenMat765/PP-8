#include <LCDFace.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);
LCDFace face;

void setup()
{
    face.InitFace(&lcd);
    face.ShowEyes(LCDFace::NORMAL_EYE);
    face.ShowMouth(4, 1, ">------<");
    face.ShowGlasses();
}

void loop()
{
    face.BlinkEyes(80);
    delay(100);
    face.BlinkEyes(80);
    delay(2000);
}
