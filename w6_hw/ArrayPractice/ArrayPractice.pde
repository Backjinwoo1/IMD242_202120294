int[] fruitAmts;
String[] fruitNames = {"mango",
  "strawberry",
  "kiwi",
  "melon",
  "blueberry"
};
color[] fruitColors;
color[] textColors;

void setup() {
  size(1280, 720);
  fruitAmts = new int[] {45, 75, 30, 60, 90}; 

  fruitColors = new color[fruitNames.length];
  fruitColors[0] = color(255, 224, 102); 
  fruitColors[1] = color(255, 182, 193); 
  fruitColors[2] = color(144, 238, 144); 
  fruitColors[3] = color(255, 228, 196); 
  fruitColors[4] = color(173, 216, 230); 
  textColors = new color[fruitNames.length];
  for (int i = 0; i < textColors.length; i++) {
    textColors[i] = color(0);
  }
}

float barGap = 225;
float barWidth = 45;
float x = 180;
float rectWeight = 2;
float yOffset = 5; 

void draw() {
  background(255);
  rectMode(CENTER);

  int total = 0;
  for (int n = 0; n < fruitAmts.length; n++) {
    total += fruitAmts[n];
  }
  int average = total / fruitAmts.length;
  int T = total;

  for (int n = 0; n < fruitNames.length; n++) {
    stroke(fruitColors[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(24);

    strokeWeight(barWidth);
    line(x + barGap * n, height * 0.5 + yOffset + 20,
      x + barGap * n, height * 0.5 + yOffset - 2 * fruitAmts[n]);

    strokeWeight(2);
    stroke(110);
    noFill();
    rect(x + barGap * n, height * 0.5 + yOffset - 116, 45, height * 0.5 + yOffset - 90);

    textSize(26);
    fill(textColors[n]);
    text(fruitNames[n],
      x + barGap * n, height * 0.5 + yOffset + 72);

    textSize(23);
    fill(112, 112, 112);
    text(fruitAmts[n],
      x + barGap * n, height * 0.5 + yOffset + 20 - 2 * fruitAmts[n]); 
  }

  textSize(26);
  fill(0);
  text("AVERAGE : ",
    width * 0.5 - 450, height * 0.5 + 295);

  textSize(26);
  fill(0);
  text(average, width * 0.5 - 380, height * 0.5 + 295);
  
  textSize(26);
  fill(0);
  text("TOTAL : ", width * 0.5 - 445, height * 0.5 + 260);
  
  textSize(26);
  fill(0);
  text(T, width * 0.5 - 380, height * 0.5 + 260);
}
