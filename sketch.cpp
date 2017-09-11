#include "Arduino.h"

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

class A {
    int a,b,c;
    
public:
    A(int a, int b, int c) {
        this->a=a;
        this->b=b;
        this->c=c;
    }
};

// the loop function runs over and over again forever
void loop() {
    A a(1,2,3);
    
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    delay(200);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    delay(200);                       // wait for a second
}