/*************
 **  PA1_Starter_mNay.pde (change this to include your name)
 **  Mark Nay
 **  9/21/2020
 **  Innovation
 **  mnay1@umbc.edu
 **  zig zags pacman while bouncing off 
 **  top and bottom and wrapping around
 */
 
//variables
float pacmanX = 80;
float pacmanY = 80;
float xDelta = 2;
float yDelta = 4;
final float PACMAN_SIZE = 70;

/*
* setup - prepares envirnment size and color
*/
void setup() {
  //set canvas size and color
  size(1200, 500);
  background(0);
}

/*
* draw - move pacman on diagonals and bounce off top 
* and bottom while rapping around left to right
*/
void draw() {
  background(0);
  fill(255,255,0);
  drawPacman();
    if (mousePressed) {
  pacmanX = pacmanX + xDelta;
  pacmanY = pacmanY + yDelta;
  //move pacman if mouse is clicked 
  }
  makePacmanBounce();
  //check bounds and make pacman bounce off top/bottom 
  makePacmanWrap();
  //wrap right to left

}
/*
* DrawPacman - draws a packman a the given x, y
*/
void drawPacman() {
   ellipse (pacmanX, pacmanY, 70, 70);
   
   fill(0);
   triangle(pacmanX, pacmanY, xDelta, yDelta, 150, 20);
    
}

/*
* makePacmanBounce - redirects pacman to opposite direction 
* when hitting top/bottom
*/
void makePacmanBounce() {
  if ((pacmanY > height - 10) || (pacmanY < 10)) {
    yDelta = -yDelta;
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
