import com.krab.lazy.*;
LazyGui gui; 
Container test;
String[] gasTypes = {"Hydrogen", "Oxygen", "Ammonia"};

void setup() {
  size(1000, 800, P2D);
  test = new Container(2, 298, true);
  gui = new LazyGui(this);
  
  float currentVolume = gui.slider("Volume", 4, 4, 10);
  gui.sliderSet("Volume", currentVolume);
  
  int currMoles = gui.sliderInt("Num of Particles", 5, 1, 75);
  
  // Toggle between gas types
  
  String currGas = gui.radio("Type of Gas", gasTypes,"Hydrogen");
   //Default gas type
  //gui.radio("Type of Gas", gasTypes, "Hydrogen");
  
  //Display all particles (can change the particles no matter where each one is)
  test.updateParticle(currMoles, currGas);
}

void draw() {
  background(255);
  fill(180, 250, 250);
  rect(400, 100, test.getWidth(), test.getHeight());
  
  Hydrogen p1 = new Hydrogen(test.temp, 500, 300);
  p1.display();
  p1.move();
  p1.bounce();
  
  //println(test.inContainer.size());
  
  //Oxygen p2 = new Oxygen(test.getTemp(), 200, 200);
  //p2.display();
  
  //Ammonia p3 = new Ammonia(test.getTemp(), 300, 300);
  //p3.display();
  
  // Volume Slider 
  
  for(Particle p:test.inContainer){
    p.display();
    p.move();
    p.bounce();
    for(Particle a:test.inContainer){
      if(!p.equals(a)){
        p.bounceAgainstParticle(a);
      }
    }
  }
  if(gui.hasChanged("Num of Particles")){
    int delta = (int)(gui.slider("Num of Particles")) - test.numMoles;
    test.updateParticle(delta,gui.radio("Type of Gas",gasTypes));
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
//  ParticleList.get(0).bounceAgainstParticle(ParticleList.get(1));
//  fill(0);
//  text(ParticleList.size(), 20, 40);
//}
