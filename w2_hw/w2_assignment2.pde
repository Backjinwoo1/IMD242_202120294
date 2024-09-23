boolean isSmiling = false; 
boolean isClicked = false; 

void setup() {
  size(640, 640);
  background(0, 104, 27);
}

void draw() {
  if (isClicked) {
    background(255, 255, 0); 
    isSmiling = true; 
  } else {
    background(0, 104, 27); 
    isSmiling = false; 
  }
  
  // 왼쪽 귀
  fill(252, 225, 195); 
  stroke(0);
  strokeWeight(7);
  ellipse(width / 2 - 150, height / 2, 40, 80); 

  // 오른쪽 귀
  fill(252, 225, 195); 
  stroke(0);
  strokeWeight(7);
  ellipse(width / 2 + 150, height / 2, 40, 80); 
  
  // 얼굴
  fill(252, 225, 195); 
  stroke(0); 
  strokeWeight(7); 
  ellipse(width / 2, height / 2, 300, 300); 
  
  // 머리카락
  fill(0); 
  noStroke();
  ellipse(width / 2, height / 2 - 183, 18, 70); 
  
  
  // 오른쪽 눈 (흰자)
  fill(255);
  stroke(0); 
  strokeWeight(4); 
  ellipse(width / 2 + 45, height / 2 - 5, 50, 50); 
  
  fill(0); 
  ellipse(width / 2 + 45, height / 2 - 5, 32, 32); 
  fill(255); 
  ellipse(width / 2 + 45, height / 2 - 9, 12, 12); 
  
  // 왼쪽 눈 (흰자)
  fill(255); 
  stroke(0); 
  strokeWeight(4); 
  ellipse(width / 2 - 45, height / 2 - 5, 50, 50); 

  if (isSmiling) {
    noFill();
    stroke(0);
    strokeWeight(7);
    arc(width / 2 - 45, height / 2 - 1, 30, 20, PI, TWO_PI); 
  } else {
    fill(0); 
    ellipse(width / 2 - 45, height / 2 - 5, 32, 32); 
  fill(255); 
  ellipse(width / 2 - 45, height / 2 - 9, 12, 12); 
  }

  //코
  noFill(); 
  stroke(0); 
  strokeWeight(5); 
  arc(width / 2, height / 2 + 23, 50, 50, 0, 3 * PI / 2); 
  
  // 왼쪽 팔자주름
  noFill(); 
  stroke(0); 
  strokeWeight(5); 
  arc(width / 2 - 24, height / 2 + 54, 50, 78, PI, 3 * PI / 2); 
  
  // 오른쪽 팔자주름
  noFill(); 
  stroke(0); 
  strokeWeight(5); 
  arc(width / 2 + 26, height / 2 + 47, 30, 48, -PI / 2, 0); 
  
  // 왼쪽 볼
  fill(255, 197, 199); 
  noStroke();
  ellipse(width / 2 - 82, height / 2 + 50, 35, 22); 

  // 오른쪽 볼
  fill(255, 197, 199); 
  noStroke();
  ellipse(width / 2 + 82, height / 2 + 50, 35, 22); 
  
  // 윗입술 
  fill(237, 129, 129); 
  stroke(0); 
  strokeWeight(6);
  beginShape();
  vertex(width / 2, height / 2 + 65); 
  bezierVertex(width / 2 - 25, height / 2 + 35, width / 2 - 50, height / 2 + 75, width / 2, height / 2 + 90); 
  bezierVertex(width / 2 + 50, height / 2 + 75, width / 2 + 25, height / 2 + 35, width / 2, height / 2 + 65); 
  endShape(CLOSE);

  // 아랫입술 
  float lowerLipY = height / 2 + 75; 
  if (isClicked) {
  lowerLipY += 15; 
  
  noFill(); 
  stroke(0);
  strokeWeight(6);
  line(width / 2 - 25, height / 2 + 87, width / 2 + 25, height / 2 + 87); 
}

  fill(237, 129, 129); 
  stroke(0); 
  strokeWeight(6); 
  arc(width / 2, lowerLipY, 50, 40, 0, PI); 
  

  // 혓바닥 
  if (isClicked) {
    fill(255, 185, 189); 
    stroke(0); 
    strokeWeight(5); 
    ellipse(width / 2, height / 2 + 83, 50, 18); 
}

  // 윗부분 테두리
  noFill(); 
  stroke(0);
  strokeWeight(6);
  line(width / 2 - 25, height / 2 + 75, width / 2 + 25, height / 2 + 75); 
}

void mousePressed() {
  isClicked = true; 
}

void mouseReleased() {
  isClicked = false; 
}
