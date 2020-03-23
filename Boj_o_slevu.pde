int pocet = 10;

Stickman player;
Enemy kosik;
Faller[] sleva = new Faller[pocet];

void setup() {
  size(1280, 720);
  player = new Stickman();
  kosik = new Enemy();
  for (int i = 0; i < pocet; i++) {
    sleva[i] = new Faller();
  }
}

void draw() {
  background(240);
  player.display();
  player.move();
  player.border();

  kosik.display();
  kosik.fall(player);
  kosik.update(player);
  if (kosik.landed()) kosik.reset();
  if (kosik.fail(player)) {
    background(0);
    fill(255);
    textSize(50);
    text("Narazil do tebe nepřítel! KONEC HRY Zkus to znovu", 15, height/2);
    kosik.failed = true;
  }
  
  for (int i = 0; i<pocet; i++) {
    sleva[i].fall(player);
    sleva[i].update();
    if (sleva[i].landed()){
      sleva[i].reset();
    }
    sleva[i].catche(player);
    sleva[i].display();
    //if(sleva[i].isCatched) score++;
  }
  
  //rect (20,20,300,300);
}


void mouseReleased() {
  for (int i = 0; i < pocet; i++) {
    sleva[i].reset();
  }
  kosik.reset();
}
