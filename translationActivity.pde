/*************************
  CONFIGS
*************************/

float screen_total = 5000;
float screen_game = 0;

int life = 3;
int score = 0;
int score_control = 0;
float velocity = 1.5;
boolean status_game = false;
boolean win = false;
boolean lost = false;

float position[] = {0, 100, 200};


/*************************
  OBSTACLE
*************************/
final float obstacle_size = 100;

float obstacle_x[] = {
  500, 800, 1200, 1500, 1700,
  1700, 1900, 2000, 2100, 2100,
  2300, 2500, 2700, 3000, 3200,
  3300, 3500, 3800, 3900, 4000,
  4200, 4300, 4500, 4700, 4700
};

float obstacle_y[] = {
  position[0], position[2], position[1], position[2], position[0],
  position[1], position[1], position[2], position[2], position[0],
  position[2], position[1], position[0], position[0], position[2],
  position[2], position[0], position[1], position[0], position[1],
  position[2], position[2], position[2], position[1], position[0]
};

boolean obstacle_status[] = {
  false, false, false, false, false,
  false, false, false, false, false,
  false, false, false, false, false,
  false, false, false, false, false,
  false, false, false, false, false,
};


/*************************
  LIFE
*************************/
float life_x[] = {900, 1800, 2700};
float life_y[] = {position[1], position[0], position[2]};
boolean life_status[] = {false, false, false};


/*************************
  PLAYER
*************************/
float player_x = 50; //50
float player_y = 150; //150
float playerSize = 40;
float player_velocity = 1.5;



/************************
  SETUP
*************************/

void setup(){
  size(800, 500);
}


/************************
  GAME
*************************/

void game(){
  int i;
  PImage life_image = loadImage("imgs/life.png");
  
  fill(0);
  textSize(25);
  text("Pontos: "+score, 20, 40);
  text("Velocidade: "+velocity, 20, 80);
  image(life_image, 250, 20);
  text(": "+life, 277, 40);
  
  // Fundo do jogo
  fill(255,255,255);
  rect(0, 100, width, height-200);  
  
  // Conjunto de objectos movendo-se da direita para esquerda
  screen_game -= velocity;
  
  translate(screen_game, 100);
  fill(255, 255, 255);
  rect(0, 0, screen_total, height-200);
  
  fill(0, 0, 200);
  textSize(25);
  rect(5000, 0, 10, height-200);
  text("FIM...", 5050, ((height-200)/2)+(25/2));
  
  // OBSTACLES
  fill(0);
  for(i=0; i < obstacle_x.length; i++){
    rect(obstacle_x[i], obstacle_y[i], obstacle_size, obstacle_size);
  }
  
  // lifes
  for(i=0; i < life_x.length; i++){
    if(!life_status[i]){
      image(life_image, life_x[i]+(100/2)-(25/2), life_y[i]+(100/2)-(25/2));
    }
  }
  
  // PLAYER
  player_x += player_velocity;
  
  if(player_x >= screen_total){
    player_velocity = 10;
  }
  
  translate(player_x, player_y);
  fill(0,255,0);
  ellipse(0, 0, playerSize, playerSize);
  
  
  // COLLISIONS
  
  // with obstacles
  for(i=0; i < obstacle_x.length; i++){
    if((player_x+(playerSize/2) >= obstacle_x[i] && player_x-(playerSize/2) <= obstacle_x[i]+100) && (player_y+(playerSize/2) >= obstacle_y[i] && player_y-(playerSize/2) <= obstacle_y[i]+100)){  
      fill(255);
      ellipse(0, 0, playerSize, playerSize);
      life--;
      screen_game = 0;
      player_x = 50;
      player_y = 150;
    }
  }
  
  // with life
  for(i=0; i < life_x.length; i++){
    if(!life_status[i] && (player_x+(playerSize/2) >= life_x[i]+(100/2)-(25/2) && player_x-(playerSize/2) <= life_x[i]+(100/2)+(25/2)) && (player_y+(playerSize/2) >= life_y[i]+(100/2)-(25/2) && player_y-(playerSize/2) <= life_y[i]+(100/2)+(25/2))){  
      fill(255);
      rect(700+(100/2)-(25/2), position[2]+(100/2)-(25/2), 25, 25);
      life++;
      life_status[i] = true;
    }
  }
  
  
  // score
  for(i=0; i < obstacle_x.length; i++){
    if(player_x-(playerSize/2) > obstacle_x[i]+obstacle_size+1 && !obstacle_status[i]){
      score = score + 10;
      obstacle_status[i] = true;
      score_control++;
    }
  }
  
  if(score % 100 == 0 && score != 0 && score_control == 10){
    velocity = velocity*2;
    player_velocity = player_velocity*2;
    score_control = 0;
  }
}


/************************
  END GAME
*************************/

void win()
{
  background(0,0,200);
  textSize(40);
  fill(255);
  text("Parabéns!", 100, height/2);
  textSize(20);
  text("Pressione a tecla 'v' para voltar ao menu principal.", 100, (height/2)+50);
  if(keyPressed && (key == 'v' || key == 'V')){
    reset();
    win = false;
  }
}

void lost()
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
    reset();
    lost = false;
  }
}

void reset()
{
  life = 3;
  score = 0;
  score_control = 0;
  screen_game = 0;
  velocity = 1.5;
  player_x = 50;
  player_y = 150;
  player_velocity = velocity;
  
  int i;
  for(i=0; i<obstacle_status.length; i++){
    obstacle_status[i] = false;
  }
  for(i=0; i<life_status.length; i++){
    life_status[i] = false;
  }
}


/************************
  MOVES
*************************/

void keyPressed(){
    if(player_y >= position[0]+50 && player_y <= position[2]+50){
      if(keyCode==UP && player_y > position[0]+50){
          player_y = player_y-100;
      }else if(keyCode==DOWN && player_y < position[2]+50){
          player_y = player_y+100;
      }
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
  text("Pressione a tecla 'c' para iniciar o jogo.", 100, (height/2)+50);
  
  if(keyPressed && (key == 'c' || key == 'C') && !status_game && !lost && !win){
    status_game = true;
  }
  
  if(status_game){
    game();
  }
  
  if(life == 0){
    status_game = false;
    lost = true;
    lost();
  }
  
  if(screen_game+screen_total+width <= 0){
    status_game = false;
    win = true;
    win();
  }
  
}
