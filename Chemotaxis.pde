int foodX, foodY;
boolean food;
Cell [] colony;
void setup(){
  size(1000,1000);
  frameRate(60);
  colony = new Cell[25];
  for (int i=0; i<colony.length;i++){
    colony[i]=new Cell();
  }
}

void draw(){
  background(0,75,0);
  for (int i=0; i<colony.length;i++){
  colony[i].move();
  colony[i].show();
  colony[i].edge();
  colony[i].food();
}
}
class Cell{
  int startX, startY;
  Cell(){
    startX=((int)(Math.random()*800)+100);
    startY=((int)(Math.random()*800)+100);
  }
  void move(){
    startX=startX+((int)(Math.random()*7)-3);
    startY=startY+((int)(Math.random()*7)-3);
  }
  void edge(){
    if (startX<=50){
      startX=startX+((int)(Math.random())+10);
    }
    if (startX>=950){
    startX=startX+((int)(Math.random())-10);
    }
    if (startY<=50){
    startY=startY+((int)(Math.random())+10);
    }
    if (startY>=950){
    startY=startY+((int)(Math.random())-10);
    }
    if (startX==foodX&&startY==foodY){
      food=false;
    }
  }
  void food(){
  if (food==true){
    fill(50,0,50);
    ellipse(foodX,foodY,10,10);
  }
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
  int r = (int)(Math.random()*251);
  int g = (int)(Math.random()*251);
  int b = (int)(Math.random()*251);
  fill(r,g,b);
  ellipse(startX, startY, 30,30); 
  }
  }
  void mouseReleased(){
    food=true;
    foodX=mouseX;
    foodY=mouseY;
    fill(50,0,50);
    ellipse(foodX,foodY,10,10);
  }
