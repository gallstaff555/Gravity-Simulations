Ball ball;

void setup() {
  size(500, 500); 
  ball = new Ball();
  
}

void draw() {
  background(200);
  ball.display();
}


class Ball {
  
  PVector mouse;
  PVector center;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Ball() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 5;
  }
  
  void update() {
    mouse = new PVector(mouseX, mouseY);
    PVector grav_ball = PVector.sub(mouse, location);
    grav_ball.normalize();
    grav_ball.mult(.5);
    acceleration = grav_ball;
    velocity.add(acceleration);
    velocity.limit(2);
    location.add(velocity);
  }
  
  void display() {
    update();
    mouse = new PVector(mouseX, mouseY);
    center = new PVector(width/2, height/2);
    
    PVector mouse_dist_from_center = new PVector(mouseX, mouseY);
    mouse_dist_from_center.sub(center);
    float length = mouse_dist_from_center.mag();
    fill(45);
    rect(0,0,length * 2,10); 
    
    mouse.sub(center);
    mouse.normalize();
    mouse.mult(50);
    ellipse(location.x, location.y, 32, 32);
    translate(width/2,height/2);
    line(0, 0, mouse.x, mouse.y); 
    ellipse(mouse.x, mouse.y, 10, 10);
    ellipse(0, 0, 10, 10);


  }
}
