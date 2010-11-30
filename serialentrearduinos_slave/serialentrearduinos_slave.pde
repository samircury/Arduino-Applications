#include <Servo.h> 

int frompc;



int ledPin =  13;    // LED connected to digital pin 13
char fromMaster = 0;
void setup()   {                

 Serial.begin(2400); 
  pinMode(ledPin, OUTPUT);     
}

// com  isto ele acende o led com w e apaga com s.

void loop() {


        if(Serial.available() > 0 ) { 	// do something when you receive data:
          
          fromMaster = Serial.read();
     
        if (fromMaster == 'w') {
                  digitalWrite(ledPin, HIGH);
          
                }
                else if (fromMaster == 's') {
                digitalWrite(ledPin, LOW);

                }

        }	

}


