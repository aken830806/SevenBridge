PImage back;
PFont font;
float centerX = 150.0;
float centerY = 325.0;
float w = 200.0;
float h = 125.0;
float buttonX = 230;
float buttonY = 420;
float buttonW = 80;
float buttonH = 30;
boolean inBotton;

void setup(){
  size(700,534);
  back = loadImage("img/back.png");
  font = createFont("Arial",1);
  init();
}
void draw(){
  if(isInButton() != inBotton){
    if(isInButton()){
      stroke(255,0,0);
      inBotton = true;
    }else{
      stroke(0);
      inBotton = false;
    }
    strokeWeight(3);
    noFill();
    rect(buttonX,buttonY,buttonW,buttonH);
    
    strokeWeight(10);
    stroke(255,255,0,90);
  }
}
void init(){
  image(back,0,0);
  
  stroke(0);
  strokeWeight(3);
  noFill();
  //rect(centerX-w/2,centerY-h/2,w,h);
  arc(centerX,centerY,w,h,0,PI/2.0);
  arc(centerX,centerY,w,h,PI/2.0,PI);
  arc(centerX,centerY,w,h,-PI,-PI/2.0);
  arc(centerX,centerY,w,h,-PI/2.0,0);
  arc(centerX-w/2,centerY-h/2,w,h,0,PI/2.0);
  arc(centerX-w/2,centerY+h/2,w,h,-PI/2.0,0);
  line(centerX-w/2,centerY,centerX+w/2,centerY);
  //button
  strokeWeight(3);
  rect(buttonX,buttonY,buttonW,buttonH);
  fill(0);
  textFont(font,20);
  text("Clear",buttonX+16,buttonY+24);
  //red point
  int radius = 20;
  strokeWeight(0);
  fill(255,0,0);
  circle(centerX,centerY-h/2,radius);//A
  circle(centerX-w/2,centerY,radius);//B
  circle(centerX+w/2,centerY,radius);//C
  circle(centerX,centerY+h/2,radius);//D
}
void mousePressed(){
  point(mouseX,mouseY);
  if(isInButton()){
    init();
  }
}
void mouseDragged(){
  point(mouseX,mouseY);
}
boolean isInButton(){
  if(mouseX > buttonX & mouseX < buttonX+buttonW &
    mouseY > buttonY & mouseY < buttonY+buttonH)
    return true;
  return false;
}
