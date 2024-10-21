int numHouses = 5; 
House[] houses = new House[numHouses];  
float baseY = 450; 
float yOffset = 20; 

void setup() {
  size(800, 800);
  drawBackground(); 
  drawHouses(); 
}

void draw() {
}

void mousePressed() {
  drawBackground(); 
  drawHouses(); 
}

void drawBackground() {
  fill(224, 238, 255); 
  rect(0, height / 2 + 30, width, height / 2); 

  fill(10, 10, 70); 
  rect(0, 30, width, height / 2); 
  
  fill(139, 69, 19); 
  for (int i = 0; i < width; i += 30) {
    rect(i, height / 2 + 280, 10, 20); 
  }
 
  fill(210, 180, 140); 
  rect(0, height / 2 + 300, width, height / 2 - 10); 
}

void drawHouses() {
  for (int i = 0; i < numHouses; i++) {
    float randomX = random(width - 150); 
    float randomY = baseY + random(-yOffset, yOffset); 
    houses[i] = new House(randomX, randomY);
    houses[i].display(); 
  }
}

class House {
  float x, y;

  House(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(210, 180, 140); 
    rect(x, y, 120, 80, 10); 

    fill(150, 120, 80); 
    beginShape();
    vertex(x, y);
    vertex(x + 120, y);
    vertex(x + 100, y + 80);
    vertex(x, y + 80);
    endShape(CLOSE);

    fill(100, 80, 50); 
    beginShape();
    vertex(x + 120, y);
    vertex(x + 120, y + 80);
    vertex(x + 100, y + 80);
    vertex(x + 100, y);
    endShape(CLOSE); 

    int roofType = (int) random(3); 
    if (roofType == 0) {
      fill(255); 
      beginShape();
      vertex(x, y);
      vertex(x + 60, y - 40); 
      vertex(x + 120, y);
      endShape(CLOSE);
    } else if (roofType == 1) {
      fill(255); 
      rect(x, y - 20, 120, 20); 
    } else {
      fill(255); 
      rect(x, y - 30, 120, 30); 

      fill(210, 180, 140); 
      rect(x, y, 120, 80, 10); 

      fill(160, 120, 80); 
      beginShape();
      vertex(x + 120, y);
      vertex(x + 120, y + 80);
      vertex(x + 100, y + 80);
      vertex(x + 100, y);
      endShape(CLOSE); 
    }

    fill(100, 50, 0); 
    rect(x + 80, y - 40, 10, 30); 

    fill(100, 50, 0);
    rect(x + 40, y + 30, 20, 50, 5); 

    fill(255);
    rect(x + 10, y + 10, 25, 25, 5); 
    rect(x + 65, y + 10, 25, 25, 5); 
  }
}
