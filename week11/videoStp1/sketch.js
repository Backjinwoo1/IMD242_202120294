let gradientText = ' .:-=+*#%@';

let canvasSize = [640, 480];
let scale = 0.1;
let captureSize = [canvasSize[0] * scale, canvasSize[1] * scale];
let tileWidth = canvasSize[0] / captureSize[0];

let capture;

function setup() {
  createCanvas(canvasSize[0], canvasSize[1]);
  capture = createCapture(VIDEO, { flipped: true });
  capture = createCapture(VIDEO);
  capture.size(captureSize[0], captureSize[1]);
  capture.hide();
}

function draw() {
  background(220);
  fill(0);
  textsize(20);
  textAlign(CENTER, CENTER);
  text(gradientText.charAt(3), 20, 20);
}
