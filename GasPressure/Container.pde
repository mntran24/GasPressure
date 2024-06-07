import com.krab.lazy.*;

class Container {
  float Height = 600;
  float Width = 350; 
  float temp;
  float IGC = 0.08206;
  float pressure;
  int numMoles; 
  String currGas;
  boolean isIdeal = true;
  ArrayList<Particle> inContainer;
  int molesH;
  int molesO;
  int molesN;
  
  Container(float P, float T, boolean isIdeal) {
    pressure = P;
    temp = T;
    this.isIdeal = isIdeal;
    inContainer = new ArrayList<Particle>();
    numMoles = inContainer.size();
    molesH = 0;
    molesO = 0;
    molesN = 0;
  }
  
  void updateParticle(int numParticles, String currentGas){
    if(numParticles>0){
      for (int n = 0; n < Math.abs(numParticles); n++) {
    if (currentGas.equals("Hydrogen")) {
      inContainer.add(new Hydrogen(temp, random(415,400+Width), random(115,100+Height)));
      molesH++;
    }
    else if (currentGas.equals("Oxygen")) {
      inContainer.add(new Oxygen(temp, random(415,400+Width), random(115,100+Height)));
      molesO++;
    }
    else if (currentGas.equals("Ammonia")) {
      inContainer.add(new Ammonia(temp, random(415,400+Width), random(115,100+Height)));
      molesN++;
    }
    }
    }
    else{
      if(Math.abs(numParticles)>=inContainer.size()){
        throw new IllegalArgumentException();
      }
      for (int n = 0; n < Math.abs(numParticles); n++) {
        if(inContainer.get(0).gasType().equals("Hydrogen")){
          molesH--;
        }
        else{
          if(inContainer.get(0).gasType().equals("Oxygen")){
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
  
  float calcPressure() {
    if (isIdeal) {
      pressure = (numMoles*IGC*temp)/(Height*Width);
      return pressure;
    }
    else {
      float pH = (IGC*temp/(Hydrogen.molarVol-Hydrogen.b))-(Hydrogen.a/Math.pow(Hydrogen.molarVol,2));
      float pO = (IGC*temp/(Oxygen.molarVol-Oxygen.b))-(Oxygen.a/Math.pow(Oxygen.molarVol,2));
      float pN = (IGC*temp/(Ammonia.molarVol-Ammonia.b))-(Ammonia.a/Math.pow(Ammonia.molarVol,2));
      
    }
  }
    
  
}
