LazyGui gui; 
Container test;
String[] gasTypes = {"Hydrogen", "Oxygen", "Ammonia"};

void setup() {
  size(1000, 800, P2D);
  test = new Container(2, 298, true);
  gui = new LazyGui(this);
  
  float currentVolume = gui.slider("Volume", 4, 4, 10);
  gui.sliderSet("Volume", currentVolume);
  
  int currNumH2 = gui.sliderInt("# of Hydrogen Particles", 0, 0, 30);
  gui.sliderSet("# of Hydrogen Particles", currNumH2);
  int currNumO2 = gui.sliderInt("# of Oxygen Particles", 0, 0, 30);
  gui.sliderSet("# of Oxygen Particles", currNumO2);
  int currNumNH3 = gui.sliderInt("# of Ammonia Particles", 0, 0, 30);
  gui.sliderSet("# of Ammonia Particles", currNumNH3);
  
  //Display all particles (can change the particles no matter where each one is)
  //test.updateParticle(currNumH2,"Hydrogen");
  //test.updateParticle(currNumO2,"Oxygen");
  //test.updateParticle(currNumNH3,"Ammonia");
  
}

void draw() {
  background(255);
  test.display();
  //Hydrogen p1 = new Hydrogen(test.temp, 500, 300);
  //p1.display();
  //p1.move();
  //p1.bounce();
  
  //println(test.inContainer.size());
  
  //Oxygen p2 = new Oxygen(test.getTemp(), 200, 200);
  //p2.display();
  
  //Ammonia p3 = new Ammonia(test.getTemp(), 300, 300);
  //p3.display();
  
  for(Particle p : test.inContainer){
    p.display();
    //p.move();
    
    //for(Particle a:test.inContainer){
    //  if(!p.equals(a)){
    //    p.bounceAgainstParticle(a, 0.02);
    //  }
    //}
  }
  
  int currH2 = gui.sliderInt("# of Hydrogen Particles");
  int currO2 = gui.sliderInt("# of Oxygen Particles");
  int currNH3 = gui.sliderInt("# of Ammonia Particles");
  
  if(gui.hasChanged("# of Hydrogen Particles")){
    //test.numMoles += gui.sliderInt("# of Hydrogen Particles");
    int delta = gui.sliderInt("# of Hydrogen Particles") - test.numMoles;
    test.updateParticle(delta, "Hydrogen");
    println("container size: "+test.inContainer.size());
    println("delta: "+delta);
  }
  
  if(gui.hasChanged("# of Oxygen Particles")){
    int delta = gui.sliderInt("# of Oxygen Particles") - currO2;
    test.updateParticle(delta, "Oxygen");
    println("container size: "+test.inContainer.size());
    println("delta: "+delta);
  }
  
  if(gui.hasChanged("# of Ammonia Particles")){
    int delta = gui.sliderInt("# of Ammonia Particles") - currNH3;
    test.updateParticle(delta, "Ammonia");
    println("container size: "+test.inContainer.size());
    println("delta: "+delta);
  }
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
//  ParticleList.get(0).bounceAgainstParticle(ParticleList.get(1), 0.3);
//  fill(0);
//  text(ParticleList.size(), 20, 40);
//}
