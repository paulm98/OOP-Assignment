Star[] stars = new Star[800];

float speed;

void setup()
{
  size(1500, 800);
  
  // I fill the array with a for loop;
  // running 800 times, it creates a new star using the Star() class.
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();}


p = new Player(width / 2, 710, 0, color(255, 0, 150), 50);
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
    



}