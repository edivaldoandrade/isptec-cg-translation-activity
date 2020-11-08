color R = color(255,0,0);
color B = color(0,0,255);
int LIFE = 3;
float VELOCITY = 2;
boolean STATUS_GAME = false;
boolean WIN = false;
boolean LOST = false;


float SCREEN_GAME = 0;

float position1 = 0;
float position2 = 100;
float position3 = 200;

float obstacle1 = 300;
float obstacle2 = 400;
float obstacle3 = 600;

float life1 = 700;
boolean life1_status = false;
float life2 = 500;
boolean life2_status = false;
float life3 = 200;
boolean life3_status = false;


/*************************
  PLAYER
*************************/
float playerX = 50; //50
float playerY = 150; //150
float playerSize = 40;
float playerVelocity = 2;



/************************
  SETUP
*************************/

void setup(){
  size(800, 500);
  //noStroke();
  
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
      if(keyCode==UP && playerY > position1+50){
          playerY = playerY-10;
      }else if(keyCode==DOWN && playerY < position3+50){
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
  
  // OBSTACLES
  fill(0);
  rect(obstacle1, position1, 100, 100);
  rect(obstacle2, position3, 100, 100);
  rect(obstacle3, position2, 100, 100);
  
  // LIFES
  if(!life1_status){
    image(life_image, life1+(100/2)-(25/2), position1+(100/2)-(25/2));
  }
  if(!life2_status){
    image(life_image, life2+(100/2)-(25/2), position2+(100/2)-(25/2));
  }
  if(!life3_status){
    image(life_image, life3+(100/2)-(25/2), position3+(100/2)-(25/2));
  }
  
  
  // PLAYER
  playerX = playerX + playerVelocity;
  
  if(playerX >= 2000){
    playerX = 0;
    playerY = 150;
  }
  
  translate(playerX, playerY);
  fill(0,255,0);
  ellipse(0, 0, playerSize, playerSize);
  
  
  
  // COLLISIONS
  // with obstacles
  if((playerX+(playerSize/2) >= obstacle1 && playerX-(playerSize/2) <= obstacle1+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  
  if((playerX+(playerSize/2) >= obstacle2 && playerX-(playerSize/2) <= obstacle2+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  
  if((playerX+(playerSize/2) >= obstacle3 && playerX-(playerSize/2) <= obstacle3+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  
  
  // with life
  if(!life1_status && (playerX+(playerSize/2) >= life1+(100/2)-(25/2) && playerX-(playerSize/2) <= life1+(100/2)+(25/2)) && (playerY+(playerSize/2) >= position1+(100/2)-(25/2) && playerY-(playerSize/2) <= position1+(100/2)+(25/2))){  
    fill(255);
    rect(700+(100/2)-(25/2), position3+(100/2)-(25/2), 25, 25);
    LIFE++;
    life1_status = true;
  }
  
  if(!life2_status && (playerX+(playerSize/2) >= life2+(100/2)-(25/2) && playerX-(playerSize/2) <= life2+(100/2)+(25/2)) && (playerY+(playerSize/2) >= position2+(100/2)-(25/2) && playerY-(playerSize/2) <= position2+(100/2)+(25/2))){  
    fill(255);
    rect(700+(100/2)-(25/2), position3+(100/2)-(25/2), 25, 25);
    LIFE++;
    life2_status = true;
  }
  
  
  if(!life3_status && (playerX+(playerSize/2) >= life3+(100/2)-(25/2) && playerX-(playerSize/2) <= life3+(100/2)+(25/2)) && (playerY+(playerSize/2) >= position3+(100/2)-(25/2) && playerY-(playerSize/2) <= position3+(100/2)+(25/2))){  
    fill(255);
    rect(700+(100/2)-(25/2), position3+(100/2)-(25/2), 25, 25);
    LIFE++;
    life3_status = true;
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
  background(200,0,0);
  textSize(40);
  fill(0);
  text("Você Perdeu!", 100, height/2);
  textSize(20);
  text("Pressione a tecla 'r' para voltar ao menu principal.", 100, (height/2)+50);
  // RESTART GAME
  if(keyPressed && (key == 'r' || key == 'R')){
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
    LIFE = 3;
    life1_status = false;
    life2_status = false;
    life3_status = false;
    LOST = false;
  }
}


/************************
  DRAW
*************************/

void draw()
{
  background(206,212,219);
  textSize(40);
  fill(0);
  text("Jogo das Tropa", 100, height/2);
  textSize(20);
  text("Pressione a tecla 's' para iniciar o jogo.", 100, (height/2)+50);
  
  if(keyPressed && (key == 's' || key == 'S') && !STATUS_GAME && !LOST){
    STATUS_GAME = true;
  }
  
  if(STATUS_GAME){
    game();
  }
  
  if(LIFE == 0){
    LOST = true;
    STATUS_GAME = false;
    endGame();
  }
  
}
