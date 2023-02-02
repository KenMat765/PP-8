#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // set the LCD address to 0x27 for a 16 chars and 2 line display
void setup()
{
    lcd.init(); // initialize the lcd

    // Print a message to the LCD.
    lcd.backlight();
    lcd.setCursor(3, 0);
    lcd.print("O        O");
    lcd.setCursor(4, 1);
    lcd.print(">------<");
}

void loop()
{
    lcd.setCursor(2, 0);
    lcd.print("[ ]      [ ]");
  
    lcd.setCursor(3, 0);
    lcd.print("-        -");
    delay(80);
    lcd.setCursor(3, 0);
    lcd.print("0        0");
    delay(80);
    lcd.setCursor(3, 0);
    lcd.print("-        -");
    delay(80);
    
    lcd.setCursor(3, 0);
    lcd.print("0        0");
    delay(2500);

    lcd.setCursor(3, 0);
    lcd.print("^        ^");
    delay(2500);

    lcd.setCursor(3, 0);
    lcd.print("-        -");
    delay(80);
    lcd.setCursor(3, 0);
    lcd.print("0        0");
    delay(80);
    lcd.setCursor(3, 0);
    lcd.print("-        -");
    delay(80);

    lcd.setCursor(3, 0);
    lcd.print("0        0");
    delay(2500);

    lcd.setCursor(3, 0);
    lcd.print("x        x");
    delay(2500);

    lcd.setCursor(3, 0);
    lcd.print("-        -");
    delay(2500);

    // lcd.setCursor(3, 0);
    // lcd.print("3        3");
    // delay(2500);

    // lcd.setCursor(3, 0);
    // lcd.print(".        .");
    // delay(2500);

    // lcd.setCursor(3, 0);
    // lcd.print("T        T");
    // delay(2500);

    // lcd.setCursor(3, 0);
    // lcd.print("*        *");
    // delay(2500);

    // lcd.setCursor(3, 0);
    // lcd.print(">        <");
    // delay(2500);
    
}
