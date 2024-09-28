void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);

  if (mouseY < height / 4) {
    line(width * .5 - 80, height / 8 - 40,
      width * .5 + 80, height / 8 + 40);
      
  } else if (mouseY < height / 4 * 2) {
    circle(width * .5, height / 8 * 3, 80); 
    
    
  } else if (mouseY < height / 4 * 3) {
    beginShape();
    vertex(width * 0.5, height / 8 * 5 - 40);
    vertex(width * 0.5 + 40, height / 8 * 5);
    vertex(width * 0.5, height / 8 * 5 + 40);
    vertex(width * 0.5 - 40, height / 8 * 5);
    endShape(CLOSE);
    
  } else {
    rect(width * 0.5, height / 8 * 7, 150, 80);
  }

  stroke(127);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);
  line(0, height / 4 * 2, width, height / 4 * 2);
  line(0, height / 4 * 3, width, height / 4 * 3);
}
