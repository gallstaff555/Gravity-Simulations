Mover[] movers = new Mover[20];

void setup() {
  size(500,500);
  for (int i = 0; i < 20; i++) {
     movers[i] = new Mover(); 
  }
}

void draw() {
    background(255);
   for (int i = 0; i < 20; i++) {
     movers[i].update();
     movers[i].checkEdges();
     movers[i].display();
   }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 5;
  }
  
  void update() {
     PVector mouse = new PVector(mouseX, mouseY);
     PVector mouseToLocation = PVector.sub(mouse, location);

     mouseToLocation.normalize();
     mouseToLocation.mult(.5);
     
     PVector randomness = new PVector(-1 + random(2), -1 + random(2));
     mouseToLocation.add(randomness);
     
     acceleration = mouseToLocation;
     
     velocity.add(acceleration);
     velocity.limit(topspeed);
     location.add(velocity);
  }
  
  void display() {
    stroke(10);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  
  void checkEdges() {
    if (location.x > width || (location.x < 0)) {
      //location.x = 0;
      velocity.mult(-1);

    }
 
    if (location.y > height || (location.y < 0)) {
      //location.y = 0;
      velocity.mult(-1);
    }
  }
}
