// PA4_mNay.pde *
// Mark Nay
// 10/30/2020
// COMP 101Y ** 
// mnay1@umbc.edu*
// Pacman 4: Win or Lose ***
// The player can move pacman with the arrow keys to eat dots,
// scoring points. If Pacman eats all dots, the game ends and 
// the player wins. The ghost chases Pac-Man and, if they catch 
// Pacman, the game ends and the player loses.

//arrays and variables
float endGame;
float points;
float collision;
float [] dotsX;
float [] dotsY;
int numOfDots = 10;
int numOfDotsRemaining = numOfDots;
float pacmanX = 180;
float pacmanY = 180;
float ghostX = 1150;
float ghostY = 50;
float xPacmanDelta = 0;
float yPacmanDelta = 0;
float xGhostDelta = 0;
float yGhostDelta = 0;
final float PACMAN_SIZE = 70;
final float HEAD_SIZE = 70;
final float EYE_SIZE = 20;
final float PUPIL_SIZE = 12;
final float GHOST_SIZE = 70;

/*
* setup - prepares envirnment size and color
*/
void setup() {
  //set canvas size and color
  size(1200, 500);
  background(0);
  frameRate(60);
  //set floats
  dotsX = new float [numOfDots];
  dotsY = new float [numOfDots];
  assignDotPositions();
  //draws xy coordinates for dots
}

/*
* draw - move pacman on diagonals and bounce off top 
* and bottom while rapping around left to right
*/

void draw() {
  background(0);
  
  drawPacman();
  //draws pacman
  makePacmanBounce();
  //check bounds and make pacman bounce off top/bottom 
  makePacmanWrap();
  //wrap right to left
  drawGhost();
  //draws a ghost
  makeGhostBounce();
  //checks bounds and makes the ghost bounce off all walls
  drawDots();
  //draws dots
  showScore();
  //shows the score
  keyPressed();
  //arrow keys movement
  followPacman();
  //ghost follows pacman
  //eatingDots();
  //lets pacman eat the dots
  winOrLose();
  //win and lose conditions
  if (endGame >= 1) {
    noLoop();
  }
}

/*
* DrawPacman - draws a packman a the given x, y
*/
void drawPacman() {
   noStroke();
   fill(255,255,0);
   //yellow pacman
   arc(pacmanX, pacmanY, 80, 80, PI*1/6, PI*11/6);
   //body
   pacmanX = pacmanX + xPacmanDelta; 
   pacmanY = pacmanY + yPacmanDelta;
}
   //movement speed

/*
* makePacmanBounce - redirects pacman to opposite direction 
* when hitting top/bottom
*/
void makePacmanBounce() {
  if (pacmanY > 490) {
    pacmanY = 490;
  }
  if (pacmanY < 10) {
    pacmanY = 10;
  }
}
/*
* makePacmanWrap - puts pacman on left when it reaches right
*/
void makePacmanWrap() {
      if (pacmanX > width - 2) {
    pacmanX = 0;
   }
      else if (pacmanX < 0) {
    pacmanX = 1200;
   }
}

void drawGhost() {
  fill(0,0,255);
  ghostX = ghostX + xGhostDelta;
  ghostY = ghostY +yGhostDelta;
  //blue ghost
  noStroke();
  ellipse (ghostX, ghostY, HEAD_SIZE, HEAD_SIZE);
  //head
  noStroke();
  rect (ghostX - 35, ghostY, GHOST_SIZE, GHOST_SIZE);
  //body
  fill(255);
  //black eyes
  ellipse (ghostX - 20, ghostY - 7, EYE_SIZE, EYE_SIZE);
  ellipse (ghostX + 20, ghostY - 7,  EYE_SIZE, EYE_SIZE);
  //eyes
  fill(0);
  //white pupils
  ellipse(ghostX - 20, ghostY - 7, PUPIL_SIZE, PUPIL_SIZE);
  ellipse(ghostX + 20, ghostY - 7, PUPIL_SIZE, PUPIL_SIZE);
  //pupils
}

//draws ghost
void makeGhostBounce() {
  //makes ghost bounce
    if ((ghostY > height - 10) || (ghostY < 10)) {
    yGhostDelta = -yGhostDelta;
   }
    if ((ghostX > width - 10) || (ghostX < 10)) {
    xGhostDelta = -xGhostDelta;
   }
}


void assignDotPositions() {
  for(int i = 0; i < numOfDots; i++) {
    dotsX[i] = random(100, 1100);
    dotsY[i] = random(100, 400);
    //sets dot positions
  }
}
//assigns random xy coordinates to dots

void drawDots() {
  //draws all dots
  fill(255,0,0);
  stroke(0, 255, 0);
  strokeWeight(4);
  for(int i = 0; i < numOfDots; i++) {
    ellipse(dotsX[i], dotsY[i], 20, 20);
  }
}

void keyPressed() {
  //allows keyboard control of pacman
  if(key == CODED) {
    if(keyCode == UP) {
      pacmanY = pacmanY - 5;
    }
    else if(keyCode == DOWN){
      pacmanY = pacmanY + 5;
    }
    else if(keyCode == LEFT) {
      pacmanX = pacmanX - 5;
    }
    else if(keyCode == RIGHT) {
      pacmanX = pacmanX + 5;
    }
  } 
}

void winOrLose() {
  if (pacmanX > (ghostX - 10) && (pacmanX < (ghostX + 10))) {
    println ("Game Over");
    endGame = 1;
    //collision detection
  }
  if (numOfDotsRemaining < 1) {
    println ("WINNER WINNER CHIKEN DINNER!");
    endGame = 1;
    //no dots left; player wins
  }
  else {
    endGame = 0;
  }
}
void showScore() {
  textSize(36);
  fill(100, 50, 200);
  text("Points: " + points, 10, 35);
}

void followPacman() {
  //makes ghost follow pacman
  if(ghostX < pacmanX) {
   xGhostDelta = 4;
  }
  if(ghostX > pacmanX) {
    xGhostDelta = -4;
  }
  if(ghostY < pacmanY) {
    yGhostDelta = 4;
  }
  if(ghostY > pacmanY) {
    yGhostDelta = -4;
  }
}
//void eatingDots() {
  //float dist = (pacmanX > (dotsX[i] - 10) && (pacmanX < (dotsX[i] + 10)));
  //println(dist);
//}
