color R = color(255,0,0);
color B = color(0,0,255);
int LIFE = 3;
int SCORE = 0;
float VELOCITY = 2;
boolean STATUS_GAME = false;
boolean WIN = false;
boolean LOST = false;

float SCREEN_TOTAL = 5000;
float SCREEN_GAME = 0;

float position1 = 0;
float position2 = 100;
float position3 = 200;

float obstacle1 = 500;
float obstacle2 = 800;
float obstacle3 = 1200;
float obstacle4 = 1500;
float obstacle5 = 1700;
float obstacle6 = 1700;
float obstacle7 = 1900;
float obstacle8 = 2000;
float obstacle9 = 2100;
float obstacle10 = 2100;
float obstacle11 = 2300;
float obstacle12 = 2500;
float obstacle13 = 2700;
float obstacle14 = 3000;
float obstacle15 = 3200;
float obstacle16 = 3300;
float obstacle17 = 3500;
float obstacle18 = 3800;
float obstacle19 = 3900;
float obstacle20 = 4000;
float obstacle21 = 4200;
float obstacle22 = 4300;
float obstacle23 = 4500;
float obstacle24 = 4700;
float obstacle25 = 4700;
boolean obstacle1_status = false;
boolean obstacle2_status = false;
boolean obstacle3_status = false;
boolean obstacle4_status = false;
boolean obstacle5_status = false;
boolean obstacle6_status = false;
boolean obstacle7_status = false;
boolean obstacle8_status = false;
boolean obstacle9_status = false;
boolean obstacle10_status = false;
boolean obstacle11_status = false;
boolean obstacle12_status = false;
boolean obstacle13_status = false;
boolean obstacle14_status = false;
boolean obstacle15_status = false;
boolean obstacle16_status = false;
boolean obstacle17_status = false;
boolean obstacle18_status = false;
boolean obstacle19_status = false;
boolean obstacle20_status = false;
boolean obstacle21_status = false;
boolean obstacle22_status = false;
boolean obstacle23_status = false;
boolean obstacle24_status = false;
boolean obstacle25_status = false;

float life1 = 1800;
float life2 = 900;
float life3 = 2700;
boolean life1_status = false;
boolean life2_status = false;
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
  text("Pontos: "+SCORE, 20, 80);
  
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
    /*
    delay(100);
    if(keyCode==UP && (playerY == position2+50 || playerY == position3+50)){
        playerY = playerY-100;
    }else if(keyCode==DOWN && (playerY == position1+50 || playerY == position2+50)){
        playerY = playerY+100;
    }
    */
  }
  
  
  
  // Conjunto de objectos movendo-se
  SCREEN_GAME = SCREEN_GAME - VELOCITY;
  if(SCREEN_GAME+SCREEN_TOTAL <= 0){
    SCREEN_GAME = 0;
  }
  translate(SCREEN_GAME, 100);
  fill(255, 255, 255);
  rect(0, 0, SCREEN_TOTAL, height-200);
  
  fill(0, 0, 200);
  textSize(25);
  rect(5000, 0, 10, height-200);
  text("FIM...", 5050, ((height-200)/2)+(25/2));
  
  // OBSTACLES
  fill(0);
  rect(obstacle1, position1, 100, 100);
  rect(obstacle2, position3, 100, 100);
  rect(obstacle3, position2, 100, 100);
  rect(obstacle4, position3, 100, 100);
  rect(obstacle5, position1, 100, 100);
  rect(obstacle6, position2, 100, 100);
  rect(obstacle7, position2, 100, 100);
  rect(obstacle8, position3, 100, 100);
  rect(obstacle9, position3, 100, 100);
  rect(obstacle10, position1, 100, 100);
  rect(obstacle11, position3, 100, 100);
  rect(obstacle12, position2, 100, 100);
  rect(obstacle13, position1, 100, 100);
  rect(obstacle14, position1, 100, 100);
  rect(obstacle15, position3, 100, 100);
  rect(obstacle16, position3, 100, 100);
  rect(obstacle17, position1, 100, 100);
  rect(obstacle18, position2, 100, 100);
  rect(obstacle19, position1, 100, 100);
  rect(obstacle20, position2, 100, 100);
  rect(obstacle21, position3, 100, 100);
  rect(obstacle22, position3, 100, 100);
  rect(obstacle23, position3, 100, 100);
  rect(obstacle24, position2, 100, 100);
  rect(obstacle25, position1, 100, 100);
  
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
  
  if(playerX >= SCREEN_TOTAL){
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
  if((playerX+(playerSize/2) >= obstacle4 && playerX-(playerSize/2) <= obstacle4+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle5 && playerX-(playerSize/2) <= obstacle5+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle6 && playerX-(playerSize/2) <= obstacle6+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle7 && playerX-(playerSize/2) <= obstacle7+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle8 && playerX-(playerSize/2) <= obstacle8+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle9 && playerX-(playerSize/2) <= obstacle9+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle10 && playerX-(playerSize/2) <= obstacle10+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle11 && playerX-(playerSize/2) <= obstacle11+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle12 && playerX-(playerSize/2) <= obstacle12+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle13 && playerX-(playerSize/2) <= obstacle13+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle14 && playerX-(playerSize/2) <= obstacle14+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle15 && playerX-(playerSize/2) <= obstacle15+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle16 && playerX-(playerSize/2) <= obstacle16+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle17 && playerX-(playerSize/2) <= obstacle17+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle18 && playerX-(playerSize/2) <= obstacle18+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle19 && playerX-(playerSize/2) <= obstacle19+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle20 && playerX-(playerSize/2) <= obstacle20+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle21 && playerX-(playerSize/2) <= obstacle21+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle22 && playerX-(playerSize/2) <= obstacle22+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle23 && playerX-(playerSize/2) <= obstacle23+100) && (playerY+(playerSize/2) >= position3 && playerY-(playerSize/2) <= position3+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle24 && playerX-(playerSize/2) <= obstacle24+100) && (playerY+(playerSize/2) >= position2 && playerY-(playerSize/2) <= position2+100)){  
    fill(255,0,0);
    ellipse(0, 0, playerSize, playerSize);
    LIFE--;
    //stop();
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
  }
  if((playerX+(playerSize/2) >= obstacle25 && playerX-(playerSize/2) <= obstacle25+100) && (playerY+(playerSize/2) >= position1 && playerY-(playerSize/2) <= position1+100)){  
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
  
  
  // SCORE
  if(playerX-(playerSize/2) > obstacle1+100+1 && !obstacle1_status){
    SCORE = SCORE + 10;
    obstacle1_status = true;
  }
  if(playerX-(playerSize/2) > obstacle2+100+1 && !obstacle2_status){
    SCORE = SCORE + 10;
    obstacle2_status = true;
  }
  if(playerX-(playerSize/2) > obstacle3+100+1 && !obstacle3_status){
    SCORE = SCORE + 10;
    obstacle3_status = true;
  }
  if(playerX-(playerSize/2) > obstacle4+100+1 && !obstacle4_status){
    SCORE = SCORE + 10;
    obstacle4_status = true;
  }
  if(playerX-(playerSize/2) > obstacle5+100+1 && !obstacle5_status){
    SCORE = SCORE + 10;
    obstacle5_status = true;
  }
  if(playerX-(playerSize/2) > obstacle6+100+1 && !obstacle6_status){
    SCORE = SCORE + 10;
    obstacle6_status = true;
  }
  if(playerX-(playerSize/2) > obstacle7+100+1 && !obstacle7_status){
    SCORE = SCORE + 10;
    obstacle7_status = true;
  }
  if(playerX-(playerSize/2) > obstacle8+100+1 && !obstacle8_status){
    SCORE = SCORE + 10;
    obstacle8_status = true;
  }
  if(playerX-(playerSize/2) > obstacle9+100+1 && !obstacle9_status){
    SCORE = SCORE + 10;
    obstacle9_status = true;
  }
  if(playerX-(playerSize/2) > obstacle10+100+1 && !obstacle10_status){
    SCORE = SCORE + 10;
    obstacle10_status = true;
  }
  if(playerX-(playerSize/2) > obstacle11+100+1 && !obstacle11_status){
    SCORE = SCORE + 10;
    obstacle11_status = true;
  }
  if(playerX-(playerSize/2) > obstacle12+100+1 && !obstacle12_status){
    SCORE = SCORE + 10;
    obstacle12_status = true;
  }
  if(playerX-(playerSize/2) > obstacle13+100+1 && !obstacle13_status){
    SCORE = SCORE + 10;
    obstacle13_status = true;
  }
  if(playerX-(playerSize/2) > obstacle14+100+1 && !obstacle14_status){
    SCORE = SCORE + 10;
    obstacle14_status = true;
  }
  if(playerX-(playerSize/2) > obstacle15+100+1 && !obstacle15_status){
    SCORE = SCORE + 10;
    obstacle15_status = true;
  }
  if(playerX-(playerSize/2) > obstacle16+100+1 && !obstacle16_status){
    SCORE = SCORE + 10;
    obstacle16_status = true;
  }
  if(playerX-(playerSize/2) > obstacle17+100+1 && !obstacle17_status){
    SCORE = SCORE + 10;
    obstacle17_status = true;
  }
  if(playerX-(playerSize/2) > obstacle18+100+1 && !obstacle18_status){
    SCORE = SCORE + 10;
    obstacle18_status = true;
  }
  if(playerX-(playerSize/2) > obstacle19+100+1 && !obstacle19_status){
    SCORE = SCORE + 10;
    obstacle19_status = true;
  }
  if(playerX-(playerSize/2) > obstacle20+100+1 && !obstacle20_status){
    SCORE = SCORE + 10;
    obstacle20_status = true;
  }
  if(playerX-(playerSize/2) > obstacle21+100+1 && !obstacle21_status){
    SCORE = SCORE + 10;
    obstacle21_status = true;
  }
  if(playerX-(playerSize/2) > obstacle22+100+1 && !obstacle22_status){
    SCORE = SCORE + 10;
    obstacle22_status = true;
  }
  if(playerX-(playerSize/2) > obstacle23+100+1 && !obstacle23_status){
    SCORE = SCORE + 10;
    obstacle23_status = true;
  }
  if(playerX-(playerSize/2) > obstacle24+100+1 && !obstacle24_status){
    SCORE = SCORE + 10;
    obstacle24_status = true;
  }
  if(playerX-(playerSize/2) > obstacle25+100+1 && !obstacle25_status){
    SCORE = SCORE + 10;
    obstacle25_status = true;
  }
}


/************************
  WIN GAME
*************************/

void win(){
  {
    STATUS_GAME = true;
    background(0,0,200);
    textSize(40);
    fill(255);
    text("Parabéns!", 100, height/2);
    textSize(20);
    text("Pressione a tecla 'v' para voltar ao menu principal.", 100, (height/2)+50);
  }
}


/************************
  END GAME
*************************/

void end()
{
  background(200,0,0);
  textSize(40);
  fill(0);
  text("Você Perdeu!", 100, height/2);
  fill(255);
  textSize(20);
  text("Pressione a tecla 'v' para voltar ao menu principal.", 100, (height/2)+50);
  // RESTART GAME
  if(keyPressed && (key == 'v' || key == 'V')){
    SCREEN_GAME = 0;
    playerX = 50;
    playerY = 150;
    LIFE = 3;
    SCORE = 0;
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
    end();
  }
  
}
