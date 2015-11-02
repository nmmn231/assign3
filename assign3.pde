PImage fighterImg, backgroundImg, backgroundImgTwo, hpImg, treasure, enemyImg;
int treasureX, treasureY, hp, enemyX, enemyY, x, enemyMode=1, speed=0, restartY;


void setup () {
  size(640,480) ; 
  
  fighterImg = loadImage("img/fighter.png");  //fighter
  hpImg = loadImage("img/hp.png"); 
  
  hp=floor(random(20,215));  //hp random
  
  treasure = loadImage("img/treasure.png");  
  treasureX=floor(random(20,520));  
  treasureY=floor(random(50,430));  //treasure random
  
  enemyImg = loadImage("img/enemy.png");
  enemyX=10;
  enemyY=floor(random(50,400));  
  restartY=floor(random(50,400)); //enemy random
  
  backgroundImg=loadImage("img/bg1.png");
  backgroundImgTwo=loadImage("img/bg2.png");
  
  
  x=0;
}


void draw() {
  background(0);
  
  //background moving
  image(backgroundImgTwo,x,0);
  image(backgroundImg,x-640,0);
  image(backgroundImgTwo,x-1280,0);
  x++;
  x=x%1280;  
  
  //hp
  stroke(255,0,0,230);
  fill(255,0,0,230);
  rectMode(CORNERS);
  rect(15,12,hp,30);  
  
  image(fighterImg,570,240);  
  image(hpImg,10,10);
  image(treasure,treasureX,treasureY);
  
  //enemy moving
  switch(enemyMode){
   case 1:
    for(int i=0;i<5;i++){
      enemyX=0-60*i+speed;
      speed++;
      image(enemyImg,enemyX,restartY);
    }
    if(enemyX>width){
      enemyMode=2; 
      speed=0;
      restartY=floor(random(50,290));
    }
    break;
      
    case 2:
    
    for(int i=0;i<5;i++){
       enemyX=0-60*i+speed;
       enemyY=restartY+30*i;
       speed++;
       image(enemyImg,enemyX,enemyY);
    }
    if(enemyX>width){
      enemyMode=3;
      speed=0;
      restartY=floor(random(110,330));
    }
    break;
   
    case 3:
    float enemyY2=50;
    for(int i=0;i<5;i++){
      if(i<=2){
       enemyY=restartY+40*i;
       enemyX=0-60*i+speed;
       speed++;
       image(enemyImg,enemyX,enemyY);
       enemyY2=restartY-40*i;
       enemyX=0-60*i+speed;
       image(enemyImg,enemyX,enemyY2);
      }else{
       enemyY-=40;
       enemyX=0-60*i+speed;
       speed++;
       image(enemyImg,enemyX,enemyY);
       enemyY2+=40;
       enemyX=0-60*i+speed;
       image(enemyImg,enemyX,enemyY2);
       }
 
    }
    if(enemyX>width){
      enemyMode=1;
      speed=0;
      restartY=floor(random(50,400));
    }
    break;
    
  }

}
     
 

  
  
  
  
