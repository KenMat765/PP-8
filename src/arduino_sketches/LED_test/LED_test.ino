#define LEDPIN 16

void setup()
{
    delay(2000);
    pinMode(LEDPIN, OUTPUT);
    digitalWrite(LEDPIN, LOW);
}

void loop()
{
    digitalWrite(LEDPIN, HIGH);
    delay(1000);

    digitalWrite(LEDPIN, LOW);
    delay(1000);
}
