int amount = 12;
Swarm[] swarm = new Swarm[amount];

void setup() {
  size(500,500);
  for (int i = 0; i < amount; i++) {
     swarm[i] = new Swarm(); 
  }
}

void draw() {
    background(255);
    for (int i = 0; i < amount; i++) {
     swarm[i].swarm_to_mouse();
     swarm[i].checkEdges();
     swarm[i].display();
   }
}
