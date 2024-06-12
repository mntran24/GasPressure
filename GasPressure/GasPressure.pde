//LazyGui gui; 
//Container test;
//String instructions = "To add new particles, move the slider corresponding to \n"
//+"the desired type of particle to the right. \n"
//+"To remove particles, move the slider to the left. \n"
//+"The temp range is from 273 to 373 K (0 to 100 C). \n"
//+"The number of each type of particles can be between 0 and 7. \n"
//+"Particle collisions are perfectly elastic. \n"
//+"Particle speed is determined with respect to molar mass \n"
//+"and temperature, divided by 5 for the sake of simulation. \n"
//+"Particle size is determine with respect to its molar volume. \n";

//String notice = "Temperature and # of particle is directly proportional to pressure. \n"
//+"Ideal gases tend to have higher pressure than non-ideal because \n"
//+"ideal behavior assumes there are no intermolecular forces. \n"
//+"The exception is Hydrogen because it is already \n"
//+"close to ideal behavior (small molar mass and particle size). \n"
//+"Larger particles move more slowly than smaller ones. \n";

//int t1 = 0;
//int t2 = 0;


//void setup() {
//  size(1200, 800, P2D);
//  test = new Container();
//  gui = new LazyGui(this);
  
//  gui.sliderInt("Temp (K)", 298, 273, 373);
  
//  int currMolesH = gui.sliderInt("# of Hydrogen", 0, 0, 7);
//  int currMolesO = gui.sliderInt("# of Oxygen", 0, 0, 7);
//  int currMolesN = gui.sliderInt("# of Ammonia", 0, 0, 7);
  
//  print(currMolesH );
//   //Default gas type
  
//  gui.toggle("Ideal Gas?", true);
  
//  //Display all particles (can change the particles no matter where each one is)
//  test.updateParticle(currMolesH, currMolesO, currMolesN);
//  //test.calcPressure(true);
  
//  //frameRate(10);
//}

//void draw() {
//  background(255);
//  test.display();
  
//  ArrayList<Particle> allParticlesH = new ArrayList<Particle>();
//  ArrayList<Particle> allParticlesO = new ArrayList<Particle>();
//  ArrayList<Particle> allParticlesN = new ArrayList<Particle>();
  
//  for (Hydrogen a : test.particlesH) {
//    allParticlesH.add(a);
//  }
//  for (Oxygen b : test.particlesO) {
//    allParticlesO.add(b);
//  }
//  for (Ammonia c : test.particlesN){
//    allParticlesN.add(c);
//  }
  
  
  
  
//  for (int n = 0; n < allParticlesH.size()-1; n++) {
//    for (int k = n+1; k < allParticlesH.size(); k++) {
//      Particle p1 = allParticlesH.get(n);
//      Particle p2 = allParticlesH.get(k);
//      PVector loc1 = p1.location;
//      PVector loc2 = p2.location;
//      PVector diffV = loc2.sub(loc1);
//      float distBtwnV = diffV.mag();
//      float distBtwnC = p1.radius + p2.radius;
      
//      if (distBtwnV <= distBtwnC) {
//        if (!p1.prevCollision.equals(p2) || !p2.prevCollision.equals(p1)) {
//          p1.collision(p2);
//          p1.bounce();
//          p2.collision(p1);
//          p2.bounce();
//          p1.move();
//          p2.move();
//        }
        
//        PVector pDist = diffV.mult(distBtwnC).div(distBtwnV);
//        p1.location.sub(pDist.sub(diffV).div(2));
//        p2.location.add(pDist.sub(diffV).div(2));
//      }
//    }
//  }
  
//  //for (Particle p : allParticlesH) {
//  //  p.bounce();
//  //}
  
//  //for (Particle p : allParticlesH) {
//  //  p.move();
//  //}
//  for (Particle p : allParticlesH) {
//    p.display();
//  }
  
  
  
  
    
//  //for(Hydrogen h:test.particlesH){
//  //  t1 += 1;
 
//  //  h.display();

//  //  h.move();
//  //  h.bounce();
    
//  //  //for (Hydrogen a: test.particlesH) {
//  //  //  if (!a.equals(h)) {
//  //  //    //t2 += 1;
//  //  //    //h.bounceAgainstParticle(a, 0.4);
//  //  //  }
//  //  //}
    
//  //  //for (Oxygen o: test.particlesO) {
//  //  //  o.bounceAgainstParticle(h, 0.4);
      
//  //  //}
    
//  //  //for (Ammonia a : test.particlesN) {
//  //  //  a.bounceAgainstParticle(h, 0.8);
      
//  //  //}
//  //  h.bounceAgainstParticle(allParticlesH, 0.7);
//  //  h.bounceAgainstParticle(allParticlesO, 0.8);
    
//  //}
//  //for(Oxygen o:test.particlesO){
//  //  o.display();
//  //  o.move();
//  //  o.bounce();
    
//  //  for (Oxygen a: test.particlesO) {
//  //    if (!a.equals(o)) {
//  //      //o.bounceAgainstParticle(a, 1);
//  //    }
//  //  } //<>//
//  //  for (Ammonia a : test.particlesN) {
//  //    //a.bounceAgainstParticle(o, 0.8);
//  //  }
      
//  //  for (Hydrogen h : test.particlesH) {
//  //    //h.bounceAgainstParticle(o, 0.4);
//  //  }
    

//  //  //o.bounceAgainstParticle(0.75);
    

//  //  //u.bounceAgainstParticle(0.8);
    
//  //}
//  //for(Ammonia n:test.particlesN){
//  //  n.display();
//  //  n.move();
//  //  n.bounce();
//  //  for(Ammonia g:test.particlesN){
//  //    if(!n.equals(g)){
//  //      n.bounceAgainstParticle(n, 0.4);
//  //    }
//  //  }
//  //  for(Hydrogen q:test.particlesH){
//  //     n.bounceAgainstParticle(q, 0.8);
//  //  }
//  //  for(Oxygen w:test.particlesO){
//  //     n.bounceAgainstParticle(w, 0.75);
//  //  }
//  //}
  
  
  

//  if(gui.hasChanged("# of Hydrogen")||gui.hasChanged("# of Oxygen")||gui.hasChanged("# of Ammonia")){
//    int deltaH = (int)(gui.slider("# of Hydrogen")) - test.molesH;
//    int deltaO = (int)(gui.slider("# of Oxygen")) - test.molesO;
//    int deltaN = (int)(gui.slider("# of Ammonia")) - test.molesN;
//    test.updateParticle(deltaH, deltaO, deltaN);
//    //test.calcPressure(gui.toggle("Ideal Gas?"));
//    println("container size: "+test.particlesH.size()+test.particlesO.size()+test.particlesN.size());
//    //println("delta: "+delta);
//  }
//  if(gui.hasChanged("Temp (K)")){
//    test.temp = gui.slider("Temp (K)");
//    //test.calcPressure(gui.toggle("Ideal Gas?"));
//    println("temp change");
//  }
//  if(gui.hasChanged("Ideal Gas?")){
//    //test.calcPressure(gui.toggle("Ideal Gas?"));
//    println("ideal change");
//  }
//  textSize(20);
//  fill(#000000);
//  text("Pressure (milliPascals): ",770,50);
//  text(test.pressure*101325*1000,970,50);
//  text("Total # of moles: ",770,90);
//  text(test.molesH+test.molesO+test.molesN,915,90);
//  text("Instructions:",770,150);
//  textSize(15);
//  text(instructions,770,170);
//  textSize(20);
//  text("Things to notice:",770,500);
//  textSize(15);
//  text(notice,770,520);
//}

////ArrayList<Particle> ParticleList;

////void setup() {
////  size(1000, 800);
////  ParticleList = new ArrayList<Particle>();
////  ParticleList.add(new Oxygen(298, 500, 300));
////  ParticleList.add(new Oxygen(298, 450, 300));
////}

////void draw(){
////    background(173, 216, 230);
////  for (Particle b : ParticleList) {
////    b.move();
////    b.bounce();
////    b.display();
////    //for(Particle a:ParticleList){
////    //  if(!b.equals(a)){
////    //    b.bounceAgainstParticle(a);
////    //  }
////    //}
////  }
////  ParticleList.get(0).bounceAgainstParticle(ParticleList.get(1));
////  fill(0);
////  text(ParticleList.size(), 20, 40);
////}




LazyGui gui; 
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
  
  int currVol = gui.sliderInt("Volume (L)", 600, 10, 600);
  test.volume = currVol;
  
  int currMolesH = gui.sliderInt("# of Hydrogen", 0, 0, 20);
  int currMolesO = gui.sliderInt("# of Oxygen", 0, 0, 20);
  int currMolesN = gui.sliderInt("# of Ammonia", 0, 0, 20);
  
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
  
  for(Hydrogen h:test.particlesH){
    h.display();
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
