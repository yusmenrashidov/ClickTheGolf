int timer, mouseCounter, score, temp;
PImage backgroundImage, startScreenImage;
boolean isStart;

void setup() {

  size(1024, 768);
  background(#16FF03);
  
  isStart = false;
  
  timer=0;
  score =0;
  
  backgroundImage= loadImage("656119.jpg");
  startScreenImage = loadImage("VW-logo.jpg");
  mouseCounter=0;
  
  // The Start Screen Properties
  
  image(startScreenImage, 370, 200); 
    
  // The header - name of the game
  textSize(55);
  fill(#4C05F5);
  text("CLICK THE GOLF",295, 150);
  
  // The reminder how to start the game
  fill(#000000);
  textSize(32);
  text("CLICK TO START", 390, 600);
  
   
}

void draw() {
  
  if(isStart == true){
    background(backgroundImage);
   
   if(mouseCounter >32 && mouseCounter<54){
    backgroundImage = loadImage("baffling-golf-2-gti-hd-car-wallpapers.jpg");
  }
  else if(mouseCounter > 54 && mouseCounter <86){
   backgroundImage = loadImage("vw_golf_3_hdr_by_dan_studio.jpg");
  }
  else if(mouseCounter > 86 && mouseCounter <128){
  backgroundImage = loadImage("vw_golf_4_clean_look_5_by_carnacior.jpg");
  }
  else if(mouseCounter > 128 && mouseCounter < 155){
   backgroundImage = loadImage("6847436221_ab0d45d5ac_b.jpg");
  }
  else if(mouseCounter >155 && mouseCounter <185){
   backgroundImage = loadImage("VW-Golf-6-R-C-Look-Front-Bumper-Extension_picture_34580.jpg");
  }
  
  else if(mouseCounter > 185){
  backgroundImage = loadImage("2015-H-and-R-Springs-Volkswagen-Golf-7-Static-1-1024x768.jpg");
  }
  
  // Showing score and result during the game
  fill(#4D07F2);
  textSize(42);
  text("TIME: "+ timer, 450, height/2);
  text("Score: "+(mouseCounter-1), 450, height/4);
  timer+=1;
  frameRate(1);
  
  // finishing the game
  if(timer >=30){
    score = mouseCounter-1;
    background(#C6C6C6);
    textSize(68);
    text("GAME OVER!!!",270, 150);
    text("YOUR SCORE: "+ score, 250, 250);
    
    textSize(22);
    text("PRESS ANY KEY TO TRY AGAIN", 350, 420);
    text("PRESS Q TO EXIT", 410, 460);
    saveHighScore(score);
    }
  }
}

void mouseClicked(){
  isStart= true;
  if(timer<31){
  mouseCounter++;
  }
}

void keyTyped(){
if(timer>30){
  if(keyPressed == true){
    if(key == 'Q' || key=='q'){
    exit();
                              }
    else if(key != 'Q' || key !='q'){
   setup();
        }
     }
  }
}

void saveHighScore(int scr){
  String lines[] = loadStrings("HighScore.txt");
  int x = int(lines[0]);
  
  if(scr > x){
 String toBeWritten = Integer.toString(scr);
 String []arr = split(toBeWritten, " ");
 saveStrings("HighScore.txt", arr);
  }
  
  if(scr > x) {
    textSize(32);
    text("HIGHEST SCORE: "+ scr, 350, 590);
  }
  else{
    textSize(32);
    text("HIGHEST SCORE: "+ x, 350, 590);
  }
}