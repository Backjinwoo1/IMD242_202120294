float circleX, circleY;

void setup() {
  size(800, 800);
}

void draw() {
  background(50, 50, 70); 


  float clockS = 350 * 0.85; 
  float clockS2 = 350 * -0.1; 
  float clockM = 350 * 0.8; 
  float clockH = 350 * 0.65; 

  circleX = width * 0.5;
  circleY = height * 0.5;

  noStroke();
  fill(135, 206, 235); 
  ellipse(circleX, circleY, 600, 600); 
  
  pushMatrix();
  translate(circleX, circleY);

  float S = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float M = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float H = map(hour() % 12 + norm(minute(), 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;

  
  stroke(255); 
  strokeWeight(2);
  strokeCap(SQUARE);
  line(0, 0, cos(S) * clockS, sin(S) * clockS);
  
  
  stroke(0, 150, 255); 
  strokeWeight(10); 
  strokeCap(SQUARE);
  line(0, 0, cos(M) * clockM, sin(M) * clockM);

  
  stroke(0, 0, 128); 
  strokeWeight(12);
  strokeCap(SQUARE);
  line(0, 0, cos(H) * clockH, sin(H) * clockH);


  for (int hourL = 0; hourL < 360; hourL += 30) {
    rotate(radians(30));
    stroke(0);
    strokeWeight(3);
    line(300, 0, 300 * 0.9, 0); 
  }


  for (int minuteL = 0; minuteL < 360; minuteL += 6) {
    rotate(radians(6));
    stroke(0);
    strokeWeight(1);
    line(300, 0, 300 * 0.97, 0); 
  }
  
  // 
  noStroke();
  fill(255); 
  ellipse(0, 0, 30, 30); 

  popMatrix();
}
