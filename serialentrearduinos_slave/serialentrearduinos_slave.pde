
#include <Servo.h> 

int frompc;

Servo servo;


// The setup() method runs once, when the sketch starts
int ledPin =  13;    // LED connected to digital pin 13
char fromMaster = 0;
void setup()   {                
  // initialize the digital pin as an output:
 Serial.begin(2400); 
  pinMode(ledPin, OUTPUT);     
}

// the loop() method runs over and over again,
// as long as the Arduino has power

void loop() {
        int position = 90;
        //
        if(Serial.available() > 0 ) {
          
          fromMaster = Serial.read();
     
        if (fromMaster == 'w') {
                  digitalWrite(ledPin, HIGH);
                 // digitalWrite(ledPin, HIGH);   // set the LED on
                }
                else if (fromMaster == 's') {
                digitalWrite(ledPin, LOW);
                  //  digitalWrite(ledPin, LOW);   // set the LED on
                }
	// send data only when you receive data:

        }	

}


