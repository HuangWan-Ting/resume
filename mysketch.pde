float ballX, ballY;
float ballSize;
float centerX, centerY;
float paddleW, paddleH;
float rightPaddleX, rightPaddleY;
float leftPaddleX, leftPaddleY;
float speedX, speedY;
boolean rightUP = false, rightDOWN = false;
boolean leftUP = false, leftDOWN = false;

int leftScore,rightScore;
boolean isPlaying = false;

void setup() {
  size(1000, 500);
  background(51,51,255);

  centerX = width/2;
  centerY = height/2;
  ballX = centerX;
  ballY = centerY;
  ballSize = 15;
  speedX = 4;
  speedY = random(-5, 5);
  paddleW = 10;
  paddleH = 80;
  rightPaddleX = width-paddleW*2;
  rightPaddleY = centerY-paddleH/2;
  leftPaddleX = paddleW;
  leftPaddleY = centerY-paddleH/2;
  leftScore = 0;
  rightScore = 0;

  // middle line
  stroke(128);
  line(centerX, 0, centerX, height);

  // ball
  noStroke();
  fill(255);
  ellipse(centerX, centerY, ballSize, ballSize);

  // paddles
  fill(255, 51, 0);
  rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
  rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
}

void draw() {
  if (isPlaying) {
    background(51,51,255);
    
    fill(204, 255, 204);///score color
    textSize(40);
    text(rightScore,750,50);
    text(leftScore,250,50);

    // middle line
    stroke(128);
    line(centerX, 0, centerX, height);

    // -------- ball
    // move
    ballX += speedX;
    ballY += speedY;
    // boundary detection
    if (ballY < 0 || ballY > height) {
      speedY *= -1;
    }
    //hit detection
    if (ballX >= rightPaddleX) {
      if (ballY >= rightPaddleY && ballY <= rightPaddleY+paddleH) {
        speedX *= -1;
      } else {
        leftScore += 1;
        isPlaying = false;
      }
    }
    if (ballX <= leftPaddleX+paddleW) {
      if (ballY >= leftPaddleY && ballY <= leftPaddleY+paddleH) {
        speedX *= -1;
      } else {
        rightScore += 1;
        isPlaying = false;
      }
    }
    //draw
    noStroke();
    fill(255);
    ellipse(ballX, ballY, ballSize, ballSize);
    // -------- ball

    // paddles
    fill(255, 51, 0);
    // right
    if (rightUP) {
      if (rightPaddleY > 0) {
        rightPaddleY -= 5;
      }
    }
    if (rightDOWN) {
      if (rightPaddleY+paddleH < height) {
        rightPaddleY += 5;
      }
    }
    rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
    // left
    if (leftUP) {
      if (leftPaddleY > 0) {
        leftPaddleY -= 5;
      }
    }
    if (leftDOWN) {
      if (leftPaddleY+paddleH < height) {
        leftPaddleY += 5;
      }
    }
    rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
  }
  else{
    background(51,51,255);
    
    // middle line
    stroke(128);
    line(centerX, 0, centerX, height);

    // ball
    noStroke();
    fill(255);
    ellipse(centerX, centerY, ballSize, ballSize);

    // paddles
    fill(255, 51, 0);
    rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
    rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
    
    fill(204, 255, 204);///score color
    textSize(40);
    text(rightScore,750,50);
    text(leftScore,250,50);
  }
}

void keyPressed() {
  //action when key is pressed
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      rightUP = true;
      break;
    case DOWN:
      rightDOWN = true;
      break;
    }
  } else {
    switch(key) {
    case ' ': //fire the bullet by setting bulletstate to true and initialize
      isPlaying = true;

      //restart
      ballX = centerX;
      ballY = centerY;
      speedX = 5;
      speedY = random(-5, 5);
      break;
    case 'w':
      leftUP = true;
      break;
    case 's':
      leftDOWN = true;
      break;
    case '+':
      if (speedX > 0)
        speedX += 1;
      else
        speedX -= 1;
      break;
    case '-':
      if (speedX > 1)
        speedX -= 1;
      else if (speedX < -1)
        speedX += 1;
      break;
    }
  }
}

void keyReleased() {
  //action when key released
  if (key==CODED) {
    switch(keyCode) {
    case UP:
      rightUP = false;
      break;
    case DOWN:
      rightDOWN = false;
      break;
    }
  } else {
    switch(key) {
    case 'w':
      leftUP = false;
      break;
    case 's':
      leftDOWN = false;
      break;
    }
  }
}