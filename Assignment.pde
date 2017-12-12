import processing.sound.*;

Star[] stars = new Star[800];

float speed;

int rectX, rectY;      // Position of square button  
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;

int bulletCounter=100;
String message = "RELOAD!!";
  PImage img;
  PImage img2;

void setup()
{
  size(1500, 800);

  img = loadImage("1.jpg");
  img2 = loadImage("2.jpg");

  // I fill the array with a for loop;
  // running 800 times, it creates a new star using the Star() class.
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();}

   
   p = new Player(width / 2, 710, 0, color(255, 0, 150), 50);
   
   rectColor = color(0);
   rectHighlight = color(51);
   baseColor = color(102);
   currentColor = baseColor;
   rectX = 1300-90-10;
   rectY = 100-90/2;
}

boolean keys[] = new boolean[1024];

Player p;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void keyPressed()
{
  
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  return keys[Character.toLowerCase(k)] || keys[Character.toUpperCase(k)]; 
}

void drawGrid()
{
  float border = 200 * 0.1f;
  
  textAlign(CENTER, CENTER);
  
  for(int xg = -5 ; xg <= 5 ; xg ++)
  {
    float pos = map(xg, -5, 5, border, 200 - border); 
    textSize(12);
    text(xg, pos, border * 0.5);
    text(xg, border * 0.5, pos);
    
    line(pos, border, pos, 200 - border);
    line(border, pos, 200 - border, pos);   
  } 
}

void draw()
{
  
    
  
   speed = map(height/2, 0, width*2, 0, 50);

  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  
  stroke(255,0,0);
  for(Bullet b:bullets)
  {
    b.update();
    b.render();
  }
  
   stroke(0);
   fill(100);
   rect(0,0,1500,200);
   
   fill(100);
   rect(0,650,1500,200);
   
   
   
  
  p.update();
  p.render();
  

    stroke(0, 255, 0);
    fill(255);
    drawGrid();
    
     update(mouseX, mouseY);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, 200, 90);
  fill(255);
  textSize(15);
  text("RELOAD",1300,100);
    
    noStroke();
    fill(255,0,0);
    ellipse(36,53,5,5);
    ellipse(53,148,5,5);
    ellipse(133,165,5,5);
    ellipse(149,37,5,5);
    ellipse(100,101,5,5);
  
    image(img, 100, 670, 200,120);
    image(img2, 480, 30, 500,120);
    
    textSize(25);
    fill(255);
    text("Ammo:", 1300, 730);

}


void update(int x, int y) {
  if ( overRect(rectX, rectY, 200, 90) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

void mousePressed() {
  if (rectOver) {
    bulletCounter=100;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}