class Star {
    
  float x;
  float y;
  float z;//for the postion of the stars
  float pz;//previous position of z
  
    Star() {
      
    x = random(-600/2, 600/2);
    
    y = random(-600/2, 600/2);
   
    z = random(width/2);
    
    pz = z;//set this the same as previous position like saying they don't move during this frame
  
}
void update()
{
    z = z - speed;
  
    if (z < 1) {
        z = width/2;
        x = random(-width/2, width/2);
        y = random(-height/2, height/2);
        pz = z;
    }
      
 }
 
 void show() {
   
    fill(255);
    noStroke();

    // with map I get the new star positions
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;

    // I use z increase the stars size
    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);

    //I use pz to get the previous position of the stars,
    // so I can draw a line from the previous position to the new (current) one.
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);

    pz = z;//makes sure pz always equals z

    stroke(255);
    line(px, py, sx, sy);

  }
}