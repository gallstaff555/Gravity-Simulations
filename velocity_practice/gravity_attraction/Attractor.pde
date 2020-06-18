class Attractor {
  float mass;
  float G; //gravitational constant
  PVector position;
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;
  
  Attractor() {
    position = new PVector(width/2, height/2);
    mass = 8;
    G = 1;
    dragOffset = new PVector(0.0, 0.0);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 50.0); //Limits distance in extreme cases
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  void display() {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging) {
      fill (50); 
    } else if (rollover) {
      fill(100);
    } else {
      fill(175,200);
    }
    ellipse(position.x, position.y, mass * 5, mass * 5);
  }
  
  void clicked(int mX, int mY) {
    float distance = dist(mX, mY, position.x, position.y);
    if (distance < mass) {
      dragging = true;
      dragOffset.x = position.x - mX;
      dragOffset.y = position.y - mY;
    }
  }
  
  void hover(int mX, int mY) {
    float distance = dist(mX, mY, position.x, position.y);
    if (distance < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
  
  void stopDragging() {
     dragging = false;
  }
  
  void drag() {
    if (dragging) {
       position.x = mouseX + dragOffset.x;
       position.y = mouseY + dragOffset.y;
    }
  }
  
}
