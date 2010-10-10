
// made by Samir Cury
// @samircury || eu@samircury.eng.br
// The goal is to use a line sensor on pin 5 to measure when the robot is on the line or not, and seek()
// tells how it seeks the line back, need improvements, but can already work =)

int left_motor = 9;
int right_motor = 10;
int ligado = LOW;
int sensorPin = 5;

void stopMotors() {
  digitalWrite(left_motor, LOW); 
  digitalWrite(right_motor, LOW); 
}

void turn_left() {
  digitalWrite(left_motor, HIGH);
  digitalWrite(right_motor, LOW);
}

void turn_right() {
  digitalWrite(right_motor, HIGH);
  digitalWrite(left_motor, LOW);
}
void go_left() {
  analogWrite(left_motor, 200);
  analogWrite(right_motor, 0);
}

void go_right() {
  analogWrite(right_motor, 200);
  analogWrite(left_motor, 0);
}

void go_forward() {
    analogWrite(right_motor, 100);
      analogWrite(left_motor, 100);
}
// Start the line sensor abstraction layer
boolean inLine() {
  int sensor = analogRead(sensorPin);  
  if ((sensor > 35) && (sensor < 110)) {
    return true;
  }
  else {
    return false;
  }
}

 int turnTime = 50;
void seek() {
  
  //buzzer code
  int buzzer=11;
  tone(turnTime,buzzer);
  
  while (!(inLine())) {
  turn_left();
  delay(turnTime);
  stopMotors();
  delay(500);
  if (inLine()) {
    break;
  }
  turn_right();
  delay(turnTime*2);
  stopMotors();
    delay(500);
  if (inLine()) {
    break;
  }
    turn_left();
  delay(turnTime);
  stopMotors();

    turnTime = turnTime+20;
  }
}  
  
  
void setup()   {                
  pinMode(left_motor, OUTPUT);     
  pinMode(right_motor, OUTPUT);    
  pinMode(13, OUTPUT);
}

void loop() {
//    if(inLine()){
//        digitalWrite(13,HIGH);
//      }
//      else{
//        digitalWrite(13,LOW);
//      }
        

         while(inLine()){
        go_forward();
      }
       seek();
 
     
}
