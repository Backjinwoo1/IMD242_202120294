let tileNumX = 16;
let tilenumY = 12;

function setup() {
  createCanvas(640, 480);
}

function draw() {
  background('#333333');
  noStroke();
  fill('cornflowerblue');
  // for (let column = 0; column < width; column += 40) {
  //   for (let row = 0; row < width; row += 40) {
  //     let x = 20 + column;
  //     let y = 20 + row;
  //     let diameter = 30;
  //     circle(x, y, diameter);
  //   }
  // }
  for (let row = 0; row < tilenumY; row++) {
    for (let column = 0; column < tileNumX; column++) {
      let tileW = width / tileNumX;
      let tileH = height / tilenumY;
      let x = tileW * 0.5 + column * tileW;
      let y = tileH * 0.5 + row * tileH;
      ellipse(x, y, tileW, tileH);
    }
  }
}
