#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

#define NORMAL_EYE '0'
#define HAPPY_EYE '^'
#define CROSS_EYE 'x'
#define SLEEPY_EYE '-'

void ShowEyes(char);
void BlinkEyes(int);
void ShowGlasses();

void setup()
{
  lcd.init();
  lcd.backlight();

  // Mouth.
  lcd.setCursor(4, 1);
  lcd.print(">----<");

  ShowGlasses();
}

void loop()
{
  ShowEyes(NORMAL_EYE);
  delay(2000);

  BlinkEyes(100);
  delay(100);
  BlinkEyes(100);
  delay(2000);

  ShowEyes(HAPPY_EYE);
  delay(2000);

  BlinkEyes(100);
  delay(100);
  BlinkEyes(100);
  delay(2000);

  ShowEyes(CROSS_EYE);
  delay(2000);

  BlinkEyes(100);
  delay(100);
  BlinkEyes(100);
  delay(2000);

  ShowEyes(SLEEPY_EYE);
  delay(2000);

  BlinkEyes(100);
  delay(100);
  BlinkEyes(100);
  delay(2000);
}

void ShowEyes(char shape)
{
  lcd.setCursor(3, 0);
  lcd.print(shape);
  lcd.setCursor(12, 0);
  lcd.print(shape);
}

void BlinkEyes(int interval_ms = 100)
{
  ShowEyes(SLEEPY_EYE);
  delay(interval_ms);
  ShowEyes(NORMAL_EYE);
}

void ShowGlasses()
{
  lcd.setCursor(2, 0);
  lcd.print("(");
  lcd.setCursor(4, 0);
  lcd.print(")      (");
  lcd.setCursor(13, 0);
  lcd.print(")");
}
