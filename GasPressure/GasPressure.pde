LazyGui gui;  //<>//
Container test;
String instructions = "To add new particles, move the slider corresponding to \n"
+"the desired type of particle to the right. \n"
+"To remove particles, move the slider to the left. \n"
+"The temp range is from 273 to 373 K (0 to 100 C). \n"
+"The number of each type of particles can be between 0 and 7. \n"
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
  
  int currTemp = gui.sliderInt("Temp (K)", 298, 273, 373);
  test.temp = currTemp;
  
  int currVol = gui.sliderInt("Volume (L)", 600, 400, 600);
  test.volume = currVol;
  
  int currMolesH = gui.sliderInt("# of Hydrogen", 0, 0, 7);
  int currMolesO = gui.sliderInt("# of Oxygen", 0, 0, 7);
  int currMolesN = gui.sliderInt("# of Ammonia", 0, 0, 7);
  
   //Default gas type
  
  gui.toggle("Ideal Gas?", true);
  
  //Display all particles (can change the particles no matter where each one is)
  test.updateParticle(currMolesH, currMolesO, currMolesN);
  test.calcPressure(true);
}

void draw() {
  background(255);
  test.display();
  if(gui.hasChanged("Volume (L)")) {
    test.volume = (int)gui.slider("Volume (L)");
  }
  
  //if (gui.hasChanged("Temp (K)")) {
  //  for (Hydrogen h:test.particlesH){
  //    h.velocity.mult(1+(gui.slider("Temp (K)")/2));
  //  }
    
  //  for(Ammonia j:test.particlesN){
  //    j.velocity.mult(1+(gui.slider("Temp (K)")/2));
  //  }
    
  //  for(Oxygen e:test.particlesO){
  //    e.velocity.mult(1+(gui.slider("Temp (K)")/2));
  //  }
  //}
  for(Hydrogen h:test.particlesH){
    h.display();
    //if (gui.hasChanged("Temp (K)")) {
    //  h.velocity.mult(1+(gui.slider("Temp (K)")/273));
    //  h.bounce(test.volume);
    //}
      
    h.move();
    h.bounce(test.volume);
   
    for(Hydrogen a:test.particlesH){
      if(!h.equals(a)){
        h.bounceAgainstParticle(a);
      }
    }
    for(Ammonia j:test.particlesN){
       h.bounceAgainstParticle(j);
    }
    for(Oxygen e:test.particlesO){
       h.bounceAgainstParticle(e);
    }
  }
  for(Oxygen o:test.particlesO){
    o.display();
    o.move();
    o.bounce(test.volume);
    
    for(Oxygen i:test.particlesO){
      if(!o.equals(i)){
        o.bounceAgainstParticle(i);
      }
    }
    for(Ammonia k:test.particlesN){
       o.bounceAgainstParticle(k);
    }
    for(Hydrogen u:test.particlesH){
       o.bounceAgainstParticle(u);
    }
  }
  for(Ammonia n:test.particlesN){
    n.display();
    n.move();
    n.bounce(test.volume);
    
    for(Ammonia g:test.particlesN){
      if(!n.equals(g)){
        n.bounceAgainstParticle(g);
      }
    }
    for(Hydrogen q:test.particlesH){
       n.bounceAgainstParticle(q);
    }
    for(Oxygen w:test.particlesO){
       n.bounceAgainstParticle(w);
    }
  }
  if(gui.hasChanged("# of Hydrogen")||gui.hasChanged("# of Oxygen")||gui.hasChanged("# of Ammonia")){
    int deltaH = (int)(gui.slider("# of Hydrogen")) - test.molesH;
    int deltaO = (int)(gui.slider("# of Oxygen")) - test.molesO;
    int deltaN = (int)(gui.slider("# of Ammonia")) - test.molesN;
    test.updateParticle(deltaH, deltaO, deltaN);
    test.calcPressure(gui.toggle("Ideal Gas?"));
    println("container size: "+test.particlesH.size()+test.particlesO.size()+test.particlesN.size());
    //println("delta: "+delta);
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
  if (gui.hasChanged("Volume (L)")) {
    test.volume = (int)gui.slider("Volume (L)");
    test.calcPressure(gui.toggle("Ideal Gas?"));
  }

  textSize(20);
  fill(#000000);
  text("Pressure (milliPascals): ",770,50);
  text(test.pressure*101325*1000,970,50);
  text("Total # of moles: ",770,90);
  text(test.molesH+test.molesO+test.molesN,915,90);
  text("Instructions:",770,150);
  textSize(15);
  text(instructions,770,170);
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
