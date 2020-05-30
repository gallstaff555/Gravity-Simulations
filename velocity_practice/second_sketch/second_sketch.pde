PVector location ;
PVector velocity;
PVector acceleration;
PVector mouse;
PVector mouse_dir;

void setup() {
  size(500, 500);
  location = new PVector(100, 100);
  velocity = new PVector(0, 0);
  //acceleration = new PVector(0, .08);


}

void draw() {
  background(255);
  //keep_in_bounds(location, velocity);
  
  //velocity = new PVector(random(-2,2), random(-2,2)); //random
  mouse = new PVector(mouseX, mouseY);
  mouse_dir = PVector.sub(mouse, location);
  mouse_dir.normalize();
  mouse_dir.mult(.5);
  
  acceleration = mouse_dir;
  
  velocity.add(acceleration);
  location.add(velocity); 
  
  //translate(width/2, height/2);
 
  velocity.limit(5);
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 16, 16);
  
}

void keep_in_bounds(PVector l, PVector v) {
   if ((l.x > width) || (l.x < 0)) {
       v.x *= -1;
   }
   if ((l.y > height) || (l.y < 0)) {
      v.y *= -1; 
   }
}
