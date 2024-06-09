import com.krab.lazy.*;

class Container {
  float Height = 600;
  float Width = 350; 
  float volume = Height*Width;
  float temp = 298;
  float IGC = 0.08206;
  float pressure = 0;
  int numMoles;
  ArrayList<Particle> inContainer;
  int molesH;
  int molesO;
  int molesN;
  
  Container() {
    //default temp = 298 K (room temp) and default pressure depends on default # of particles and type of particle (configured in setup())
    inContainer = new ArrayList<Particle>();
    numMoles = inContainer.size();
    molesH = 0;
    molesO = 0;
    molesN = 0;
  }
  //updates the number of particles
  void updateParticle(int numParticles, String currentGas){
    if(numParticles>0){
      for (int n = 0; n < Math.abs(numParticles); n++) {
    if (currentGas.equals("Hydrogen")) {
      inContainer.add(new Hydrogen(temp, random(420,380+Width), random(120,80+Height)));
      molesH++;
    }
    else if (currentGas.equals("Oxygen")) {
      inContainer.add(new Oxygen(temp, random(420,380+Width), random(120,80+Height)));
      molesO++;
    }
    else if (currentGas.equals("Ammonia")) {
      inContainer.add(new Ammonia(temp, random(420,380+Width), random(120,80+Height)));
      molesN++;
    }
    }
    }
    else{
      if(Math.abs(numParticles)>=inContainer.size()){
        throw new IllegalArgumentException();
      }
      for (int n = 0; n < Math.abs(numParticles); n++) {
        if(inContainer.get(0).gasType.equals("Hydrogen")){
          molesH--;
        }
        else{
          if(inContainer.get(0).gasType.equals("Oxygen")){
            molesO--;
          }
          else{
            molesN--;
          }
        }
        inContainer.remove(0);
      }
    }
    numMoles = inContainer.size();
  }
  
  void display(){
    fill(180, 250, 250);
    rect(400, 100, Width, Height);
  }
  
  //calculates pressure depending on whether we assume it's an ideal gas
  float calcPressure(boolean ideal) {
    if (ideal) {
      //using Ideal Gas Law
      pressure = (numMoles*IGC*temp)/(volume);
      return pressure;
    }
    else {
      //using Van Der Waal's eqn
      double pH = (molesH*IGC*temp/(volume-molesH*bHydrogen))-(aHydrogen*Math.pow(molesH,2)/Math.pow(volume,2));
      double pO = (molesO*IGC*temp/(volume-molesO*bOxygen))-(aOxygen*Math.pow(molesO,2)/Math.pow(volume,2));
      double pN = (molesN*IGC*temp/(volume-molesN*bAmmonia))-(aAmmonia*Math.pow(molesN,2)/Math.pow(volume,2));
      pressure = (float)pH+(float)pO+(float)pN;
      return pressure;
    }
  }
    
  
}
