class Player
{
  float speed;
  PVector pos;
  PVector forward;
  color c;
  float theta;
  float radius;
  float rotSpeed;
  
  Player(float x, float y, float theta, color c, float radius)
  {
    pos = new PVector(x, y);
    this.theta = theta;
    this.c = c;
    forward = new PVector(0, -1);
    rotSpeed = 0.1f;
    this.speed = 10;
    this.radius = radius; 
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    if (checkKey('a'))
    {
      theta -= rotSpeed;
    }
    if (checkKey('d'))
    {
      theta += rotSpeed;
    }
      
    
    if (checkKey(' '))
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, radius + 2));
      Bullet b = new Bullet(bp.x, bp.y, theta, speed * 2);
      bullets.add(b);
      
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(c);
    line(-radius,  radius, 0 ,  - radius);
    line(0 ,  - radius,  radius,  radius);
    line( radius,  radius, 0 , 0);
    line(0, 0,  - radius,  radius);  
    popMatrix();
  }
}