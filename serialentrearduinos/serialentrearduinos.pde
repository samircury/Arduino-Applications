
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

	// send data only when you receive data:
	if (Serial.available() > 0) {
		// read the incoming byte:
		frompc = Serial.read();
                if (frompc == 'w') {
                  position++;
                 // digitalWrite(ledPin, HIGH);   // set the LED on
                }
                else if (frompc == 's') {
                  position--;
                  //  digitalWrite(ledPin, LOW);   // set the LED on
                }
                delay(position);
                digitalWrite(ledPin, HIGH);
                 delay(position);
                 digitalWrite(ledPin, LOW);


	}
  servo.write(position);
}


