color R = color(255,0,0);
color B = color(0,0,255);
int LIFE = 3;
float VELOCITY = 2;
boolean STATUS_GAME = true;

float SCREEN_GAME = 0;

float position1 = 0;
float position2 = 100;
float position3 = 200;

float obstacle1 = 300;
float obstacle2 = 400;
float obstacle3 = 600;

float life1 = 700;
float life2 = 500;
float life3 = 200;

/*************************
  PLAYER
*************************/
float playerX = 50;
float playerY = 150;
float playerSize = 40;
float playerVelocity = 2;



/*************************
  CLASS OBSTACLE
*************************/

class Obstacle{
}


/************************
  SETUP
*************************/

void setup(){
  size(800, 500);
  background(206,212,219);
  //noStroke();
  R = color(255,0,0);
  B = color(0,0,255);
  
}


/************************
  GAME
*************************/

void game(){
  PImage life_image = loadImage("imgs/life.png");
  
  fill(0);
  textSize(25);
  text("Nível: 1", 20, 40);
  image(life_image, 200, 20);
  text(": "+LIFE, 227, 40);
  
  // Fundo do jogo
  fill(255,255,255);
  rect(0, 100, width, height-200);
  
  
  
  // COMMANDS
  if (keyPressed){
    if(playerY >= position1+50 && playerY <= position3+50){
      if(keyCode==38 && playerY > position1+50){
          playerY = playerY-10;
      }else if(keyCode==40 && playerY < position3+50){
          playerY = playerY+10;
      }
    }
    /*if(keyCode==38 && (playerY == position2+50 || playerY == position3+50)){
        playerY = playerY-100;
    }else if(keyCode==40 && (playerY == position1+50 || playerY == position2+50)){
        playerY = playerY+100;
    }*/
  }
  
  // Conjunto de objectos movendo-se
  SCREEN_GAME = SCREEN_GAME - VELOCITY;
  if(SCREEN_GAME+2000 <= 0){
    SCREEN_GAME = 0;
  }
  translate(SCREEN_GAME, 100);
  fill(255,255,255);
  rect(0, 0, 2000, height-200);
  
  fill(0);
  rect(obstacle1, position1, 100, 100);
  rect(obstacle2, position3, 100, 100);
  rect(obstacle3, position2, 100, 100);
  
  // LIFES
  image(life_image, life1+(100/2)-(25/2), position1+(100/2)-(25/2));
  image(life_image, life2+(100/2)-(25/2), position2+(100/2)-(25/2));
  image(life_image, life3+(100/2)-(25/2), position3+(100/2)-(25/2));
  
  // PLAYER
  playerX = playerX + playerVelocity;
  
  if(playerX >= 2000){
    playerX = 0;
  }
  
  translate(playerX, playerY);
  fill(0,255,0);
  ellipse(0, 0, playerSize, playerSize);
  
  // COLLISIONS
  if((playerX+(playerSize/2) >= obstacle1 && playerX <= obstacle1+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    stop();
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
  }
  
  if((playerX+(playerSize/2) >= obstacle2 && playerX <= obstacle2+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    stop();
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
  }
  
}


/************************
  WIN GAME
*************************/

void winGame(){
  {
    STATUS_GAME = true;
    background(255,255,255);
    fill(0);
    textSize(50);
    text("Você venceu!", 200, 350);
    fill(255,0,0);
    textSize(30);
    text("Pressione a tecla 'r' para reiniciar o jogo", 100, 400);
  }
}


/************************
  END GAME
*************************/

void endGame()
{
  background(100, 100, 100);
  textSize(40);
  fill(0);
  text("Fim de Jogo!", width/2, height/2);
  textSize(20);
  text("Pressione a tecla 'r' para reiniciar o jogo", 200, 400);
}


/************************
  DRAW
*************************/

void draw(){
  game();
  
  if(LIFE == 0){
    endGame();
  }
  
  if(keyPressed && (key == 'r' || key == 'R')){
    game();
  }
}
