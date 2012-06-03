void setup() {
  // initialize both serial ports:
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {
  // read from port 1, send to port 0:
  while (Serial1.available()) {
    char inByte = Serial1.read();
    Serial.write(inByte); 
  }
}
