LazyGui gui; 
Container test;
String[] gasTypes = {"Hydrogen", "Oxygen", "Ammonia"};
String instructions = "To add new particles, move the slider to the right and make sure \n"
+"you have selected the type of particle you would like. \n"
+"To remove particles, move the slider to the left. \n"
+"Note that the particles are removed according to FIFO. \n"
+"The temp range is from 273 to 373 K (0 to 100 C). \n"
+"The number of particles can be between 1 and 20. \n"
+"Particle collisions are perfectly elastic. \n"
+"Particle speed is determined with respect to molar mass \n"
+"and temperature, divided by 5 for the sake of simulation. \n"
+"Particle size is determine with respect to its molar volume. \n";

String notice = "Temperature and # of particle is directly proportional to pressure. \n"
+"Ideal gases tend to have higher pressure than non-ideal because \n"
+"ideal behavior assumes there are no intermolecular forces. \n"
+"The exception is Hydrogen because it is already \n"
+"close to ideal behavior (small molar mass and particle size). \n"
+"Larger particles move more slowly than smaller ones. \n";

void setup() {
  size(1200, 800, P2D);
  test = new Container();
  gui = new LazyGui(this);
  
  gui.sliderInt("Temp (K)", 298, 273, 373);
  
  int currMoles = gui.sliderInt("Num of Particles", 5, 1, 20);
  
  // Toggle between gas types
  
  String currGas = gui.radio("Type of Gas", gasTypes,"Hydrogen");
   //Default gas type
  
  gui.toggle("Ideal Gas?", true);
  
  //Display all particles (can change the particles no matter where each one is)
  test.updateParticle(currMoles,currGas);
  test.calcPressure(true);
}

void draw() {
  background(255);
  test.display();
  
  for(Particle p:test.inContainer){
    p.display();
    p.move();
    p.bounce();
    //for(Particle a:test.inContainer){
    //  if(!p.equals(a)){
    //    p.bounceAgainstParticle(a);
    //  }
    //}
  }
  if(gui.hasChanged("Num of Particles")){
    int delta = (int)(gui.slider("Num of Particles")) - test.numMoles;
    test.updateParticle(delta,gui.radio("Type of Gas",gasTypes));
    test.calcPressure(gui.toggle("Ideal Gas?"));
    println("container size: "+test.inContainer.size());
    println("delta: "+delta);
  }
  if(gui.hasChanged("Temp (K)")){
    test.temp = gui.slider("Temp (K)");
    test.calcPressure(gui.toggle("Ideal Gas?"));
    println("temp change");
  }
  if(gui.hasChanged("Ideal Gas?")){
    test.calcPressure(gui.toggle("Ideal Gas?"));
    println("ideal change");
  }
  textSize(20);
  fill(#000000);
  text("Pressure (milliPascals): ",770,50);
  text("Instructions:",770,120);
  textSize(15);
  text(instructions,770,140);
  textSize(20);
  text("Things to notice:",770,500);
  textSize(15);
  text(notice,770,520);
}

//ArrayList<Particle> ParticleList;

//void setup() {
//  size(1000, 800);
//  ParticleList = new ArrayList<Particle>();
//  ParticleList.add(new Oxygen(298, 500, 300));
//  ParticleList.add(new Oxygen(298, 450, 300));
//}

//void draw(){
//    background(173, 216, 230);
//  for (Particle b : ParticleList) {
//    b.move();
//    b.bounce();
//    b.display();
//    //for(Particle a:ParticleList){
//    //  if(!b.equals(a)){
//    //    b.bounceAgainstParticle(a);
//    //  }
//    //}
//  }
//  ParticleList.get(0).bounceAgainstParticle(ParticleList.get(1));
//  fill(0);
//  text(ParticleList.size(), 20, 40);
//}
