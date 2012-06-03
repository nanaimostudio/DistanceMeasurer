/*
HC-SR04 Ultrasonic module results to Arduino serial monitor
*/
#define ECHOPIN 2        // Pin to receive echo pulse
#define TRIGPIN 3        // Pin to send trigger pulse

void setup()
{
  Serial.begin(9600);
  pinMode(ECHOPIN, INPUT);
  pinMode(TRIGPIN, OUTPUT);
}

void loop()
{
  // Trigger Trig pin to Start Ranging
  digitalWrite(TRIGPIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIGPIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIGPIN, LOW);
  // Compute distance
  float distance = pulseIn(ECHOPIN, HIGH);
//pulseIn(pin,value) reads a pulse length of the value.(microseconds)
  distance= distance/58; 
// From datasheet: pluse width(uS)/58 = distance (cm)
// pluse width(uS)/148 = distance (inch)
  Serial.println(distance);
  delay(1000); // return distance per second.

}




