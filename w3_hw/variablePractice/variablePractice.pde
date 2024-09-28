void setup() {
  size(1280, 720);
  background(0);
}

void mousePressed() {
  background(0);
}

void draw() {
  float x = random(width);
  float y = random(height);
  float s = random(3, 10); 
  strokeWeight(random(0.5, 3));
  
  float r = random(150, 255); 
  float g = random(50, 200);  
  float b = random(0, 100);  
  stroke(r, g, b, 45);
  
  for (int i = 0; i < 10; i++) {
    float angle = random(TWO_PI); 
    float lineLength = random(70, 120); 
    float xEnd = x + cos(angle) * lineLength;
    float yEnd = y + sin(angle) * lineLength;
    line(x, y, xEnd, yEnd);
  }
  
  fill(r, g, b, 150);
  noStroke();
  
  if (random(1) < 0.33) {
    ellipse(x, y, s, s); 
  } else if (random(1) < 0.67) {
    rect(x, y, s, s); 
  }
}
