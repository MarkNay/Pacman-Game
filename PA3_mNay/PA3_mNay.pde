/*************
 **  PA3_mNay.pde (change this to include your name)
 **  Mark Nay
 **  10/10/2020
 **  Innovation
 **  mnay1@umbc.edu
 **  zig zags pacman while bouncing off 
 **  top and bottom and wrapping around
 */
 //arrays and variables
float [] dotsX;
float [] dotsY;
int numOfDots = 50;
float pacmanX = 180;
float pacmanY = 180;
float ghostX = 50;
float ghostY = 50;
float xPDelta = 2;
float xGDelta = 2;
float yPDelta = 4;
float yGDelta = 4;
//float 
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
  
  assignDotPositions();
  //draws xy coordinates for dots
  drawDots();
  //draws dots
}


/*
* DrawPacman - draws a packman a the given x, y
*/
void drawPacman() {
   fill(255,255,0);
   //yellow pacman
   arc(pacmanX, pacmanY, 80, 80, PI*1/6, PI*11/6);
   //body
   pacmanX = pacmanX + xPDelta; 
   pacmanY = pacmanY + yPDelta;   
   //movement speed
}

/*
* makePacmanBounce - redirects pacman to opposite direction 
* when hitting top/bottom
*/
void makePacmanBounce() {
  if ((pacmanY > height - 10) || (pacmanY < 10)) {
    yPDelta = -yPDelta;
  }
}
/*
* makePacmanWrap - puts pacman on left when it reaches right
*/
void makePacmanWrap() {
      if (pacmanX > width - 2) {
    pacmanX = 1;
  }
}

void drawGhost() {
  fill(0,0,255);
  //blue ghost
  noStroke();
  ellipse (ghostX, ghostY, HEAD_SIZE, HEAD_SIZE);
  //head
  noStroke();
  rect(ghostX - 35, ghostY, GHOST_SIZE, GHOST_SIZE);
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
  ghostX = ghostX + xGDelta;
  //ghost movement
}
//draws ghost
void makeGhostBounce() {
    if ((ghostY > height - 10) || (ghostY < 10)) {
    yGDelta = -yGDelta;
    }
    if ((ghostX > width - 10) || (ghostX < 10)) {
    xGDelta = -xGDelta;
    }
}
//makes ghost bounce

void assignDotPositions() {
  for(int i = 0; i < numOfDots; i++) {
    dotsX[i] = random(10, 1190);
    dotsY[i] = random(10, 1190);
    //sets dot positions
  }
}
//assigns random xy coordinates to dots

void drawDots() {
  fill(255,0,0);
  stroke(0, 255, 0);
  strokeWeight(4);
  for(int i = 0; i <= 50; i++) {
    ellipse(dotsX[i], dotsY[i], 20, 20);
  }
}
//draws all dots
