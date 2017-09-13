#include "Arduino.h"
#include "LiquidCrystal/LiquidCrystal.h"

LiquidCrystal lcd(8,9,4,5,6,7);



void setup() {
    lcd.begin(16,2);
    lcd.setCursor(0,0);
    lcd.print("TIMER=");
}

int analog_value;

void analog() {
    analog_value = analogRead(0);
}


// the loop function runs over and over again forever
void loop() {
    timer++;
    lcd.setCursor(6,0);
    lcd.print(millis());
    delay(100);
}