
#include <Servo.h> 

int frompc;

Servo servo;


// The setup() method runs once, when the sketch starts
int ledPin =  13;    // LED connected to digital pin 13
void setup()   {                
  // initialize the digital pin as an output:
 Serial.begin(2400); 
 servo.attach(2);
  pinMode(ledPin, OUTPUT);     
}

// the loop() method runs over and over again,
// as long as the Arduino has power

void loop() {
        int position = 90;
        //
        Serial.write("w");
        delay(500);
        Serial.write("s");

	// send data only when you receive data:

	

}


