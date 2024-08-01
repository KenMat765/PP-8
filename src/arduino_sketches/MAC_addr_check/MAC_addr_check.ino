#include <WiFi.h>

#define BAUDRATE 9600

String MAC_str;
char MAC[17];

void setup()
{
    Serial.begin(BAUDRATE);

    // === MAC address === //
    MAC_str = WiFi.macAddress();
    MAC_str.toCharArray(MAC, sizeof(MAC) + 1);

    delay(100);
}

void loop()
{
    Serial.println(MAC_str);
    delay(5000);
}
