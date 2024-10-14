int tileNum;
int randomSeed = 0;
float noiseMult = 0.01;
float noiseVal;
float t = 0;
float prevRotateAngle = 0; 

void setup() {
  size(800, 800);
}

void draw() {
  noiseSeed(randomSeed);
  randomSeed(randomSeed);
  background(0);
  
  tileNum = int(map(mouseX, 0, width, 3, 17));
  noiseMult = pow(10, map(mouseY, 0, height, -1, 4));
  float tileSize = width / float(tileNum);
  
  float timeStep = map(mouseY, 0, height, .1, .0001);
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * .5;
      float circleX = tileSize * .4;
      float centerY = rectY + tileSize * .5;
      
      fill(0);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      noFill();
      stroke(255);
      circle(0, 0, tileSize);
      
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult, t);
      float range = map(mouseY, 0, height, 500, 100); 
      float targetRotateAngle = radians(-range + 2 * range * noiseVal);
      
    
      float smoothRotateAngle = lerp(prevRotateAngle, targetRotateAngle, 0.1);
      rotate(smoothRotateAngle);
      prevRotateAngle = smoothRotateAngle; 
      
      line(0, 0, tileSize * .5, 0);
      noStroke();
      fill(255);
      circle(circleX, 0, tileSize * .19);
      popMatrix();
    }
  }
  t += timeStep;
}
