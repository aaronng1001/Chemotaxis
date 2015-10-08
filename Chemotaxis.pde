int foodX, foodY;
boolean food;
Bacteria [] colony;
void setup(){
  size(500,500);
  // frameRate(60);
  colony = new Bacteria[50];
  for (int i=0; i<colony.length;i++){
    colony[i]=new Bacteria();
  }
}

void draw(){
  background(50,75,150);
  if (mousePressed==true){
    food=true;
  }
  if (food==true){
    foodX=mouseX;
    foodY=mouseY;
    fill(50,0,50);
    ellipse(foodX,foodY,10,10);
  }

  for (int i=0; i<colony.length;i++){
    colony[i].move();
    colony[i].food();
    colony[i].edge();
    colony[i].show();
  }
}
class Bacteria{
  int startX, startY;
  Bacteria(){
    startX=((int)(Math.random()*300)+100);
    startY=((int)(Math.random()*300)+100);
  }
  void move(){
    startX=startX+((int)(Math.random()*7)-3);
    startY=startY+((int)(Math.random()*7)-3);
  }
  void edge(){
    if (startX<=25){
      startX=startX+((int)(Math.random())+10);
    }
    if (startX>=475){
    startX=startX+((int)(Math.random())-10);
    }
    if (startY<=25){
    startY=startY+((int)(Math.random())+10);
    }
    if (startY>=475){
    startY=startY+((int)(Math.random())-10);
    }
    if (startX==foodX&&startY==foodY){
      food=false;
    }
  }
  void food(){
    // if (food==true){
    //   fill(50,0,50);
    //   ellipse(foodX,foodY,10,10);
    // }
    if (food==true){
      if (startX<foodX){
        startX=startX+((int)(Math.random()*9));
      }
      if (startX>foodX){
        startX=startX+((int)(Math.random()*9)-8);
      }
      if (startY<foodY){
        startY=startY+((int)(Math.random()*9));
      }
      if (startY>foodY){
        startY=startY+((int)(Math.random()*9)-8);
      }
    }
  }
  void show(){
    fill(startX/4,startY/4,75,100);
    ellipse(startX, startY, 15,15); 
  }
}
// void mouseReleased(){
//     food=true;
//     foodX=mouseX;
//     foodY=mouseY;
//     fill(50,0,50);
//     ellipse(foodX,foodY,10,10);
//   }
