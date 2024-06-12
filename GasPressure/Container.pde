//import com.krab.lazy.*;

//class Container {
//  float Height = 600;
//  float Width = 350; 
//  float temp;
//  float IGC = 0.08206;
//  float pressure;
//  int numMoles; 
//  String currGas;
//  color c;
//  boolean isIdeal = true;
//  ArrayList<Particle> inContainer; 
  
//  Container(float P, float T, boolean isIdeal) {
//    pressure = P;
//    temp = T;
//    this.isIdeal = isIdeal;
//    inContainer = new ArrayList<Particle>();
//    numMoles = inContainer.size();
//  }
  
//  void updateParticle(int numParticles, String currentGas){
//    if(numParticles>0){
//      for (int n = 0; n < Math.abs(numParticles); n++) {
//        if (currentGas.equals("Hydrogen")) {
//          inContainer.add(new Hydrogen(temp, random(453,400+Width-53), random(153,100+Height-53)));
//        }
//        else if (currentGas.equals("Oxygen")) {
//          inContainer.add(new Oxygen(temp, random(460,400+Width-60), random(160,100+Height-60)));
//        }
//        else if (currentGas.equals("Ammonia")) {
//          inContainer.add(new Ammonia(temp, random(480,400+Width-80), random(180,100+Height-80)));
//        }
//      }
//    }
//    else{
//      //if(Math.abs(numParticles)>=inContainer.size()){
//      //  throw new IllegalArgumentException();
//      //}
//      int num = 0;
//      //int currNumMoles = numMoles;
//      for (int n = 0; n < numMoles; n++) {
//        if (num >= Math.abs(numParticles)) {
//          break;
//        }
//        if (inContainer.get(n).getName().equals(currentGas)) {
//          inContainer.remove(n);
//          n -= 1;
//          num += 1;
//        }
//      }
//    }
//    numMoles = inContainer.size();
//  }
  
//  void display(){
//    fill(180, 250, 250);
//    rect(400, 100, Width, Height);
//  }
  
//  //public float calcPressure() {
//  //  if (isIdeal) {
//  //    float P = (moles*IGC*temp)/getVolume();
//  //    return P;
//  //  }
    
//  //  else {
      
//  //  }
//  //}
    
  
//}


import com.krab.lazy.*;

class Container {
  float Height = 600;
  float Width = 350; 
  float volume = Height*Width;
  float temp = 298;
  float IGC = 0.08206;
  float pressure = 0;
  ArrayList<Particle> allParticles;
  ArrayList<Hydrogen> particlesH;
  ArrayList<Oxygen> particlesO;
  ArrayList<Ammonia> particlesN;
  int molesH;
  int molesO;
  int molesN;
  int indH;
  int indO;
  int indN;
  
  Container() {
    //default temp = 298 K (room temp) and default pressure depends on default # of particles and type of particle (configured in setup())
    allParticles = new ArrayList<Particle>();
    particlesH = new ArrayList<Hydrogen>();
    particlesO = new ArrayList<Oxygen>();
    particlesN = new ArrayList<Ammonia>();
    molesH = 0;
    molesO = 0;
    molesN = 0;
    indH = 0;
    indO = 0;
    indN = 0;
  }
  //updates the number of particles
  void updateParticle(int numH, int numO, int numN){
    if(numH>=0){
      for(int m=0;m<numH;m++){
        particlesH.add(new Hydrogen(temp, random(420,380+Width), random(120,80+Height)));
        
      }
    }
    else{
      for(int m=0;m<Math.abs(numH);m++){
        particlesH.remove(0);
      }
    }
    if(numO>=0){
      for(int n=0;n<numO;n++){
        particlesO.add(new Oxygen(temp, random(420,380+Width), random(120,80+Height)));
      }
    }
    else{
      for(int n=0;n<Math.abs(numO);n++){
        particlesO.remove(0);
      }
    }
    if(numN>=0){
      for(int p=0;p<numN;p++){
        particlesN.add(new Ammonia(temp, random(420,380+Width), random(120,80+Height)));
      }
    }
    else{
      for(int p=0;p<Math.abs(numN);p++){
        particlesN.remove(0);
      }
    }
    molesH = particlesH.size();
    molesO = particlesO.size();
    molesN = particlesN.size();
  }
  
  void display(){
    fill(180, 250, 250);
    rect(400, 100, Width, Height);
  }
  
  //calculates pressure depending on whether we assume it's an ideal gas
  //float calcPressure(boolean ideal) {
  //  if (ideal) {
  //    //using Ideal Gas Law
  //    pressure = ((molesH+molesN+molesO)*IGC*temp)/(volume);
  //    return pressure;
  //  }
  //  else {
  //    //using Van Der Waal's eqn
  //    double pH = (molesH*IGC*temp/(volume-molesH*bHydrogen))-(aHydrogen*Math.pow(molesH,2)/Math.pow(volume,2));
  //    double pO = (molesO*IGC*temp/(volume-molesO*bOxygen))-(aOxygen*Math.pow(molesO,2)/Math.pow(volume,2));
  //    double pN = (molesN*IGC*temp/(volume-molesN*bAmmonia))-(aAmmonia*Math.pow(molesN,2)/Math.pow(volume,2));
  //    pressure = (float)pH+(float)pO+(float)pN;
  //    return pressure;
  //  }
  //}
    
  
}
