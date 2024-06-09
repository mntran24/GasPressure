import com.krab.lazy.*;

class Container {
  float Height = 600;
  float Width = 350; 
  float temp;
  float IGC = 0.08206;
  float pressure;
  int numMoles; 
  String currGas;
  color c;
  boolean isIdeal = true;
  ArrayList<Particle> inContainer; 
  
  Container(float P, float T, boolean isIdeal) {
    pressure = P;
    temp = T;
    this.isIdeal = isIdeal;
    inContainer = new ArrayList<Particle>();
    numMoles = inContainer.size();
  }
  
  void updateParticle(int numParticles, String currentGas){
    if(numParticles>0){
      for (int n = 0; n < Math.abs(numParticles); n++) {
        if (currentGas.equals("Hydrogen")) {
          inContainer.add(new Hydrogen(temp, random(453,400+Width-53), random(153,100+Height-53)));
        }
        else if (currentGas.equals("Oxygen")) {
          inContainer.add(new Oxygen(temp, random(460,400+Width-60), random(160,100+Height-60)));
        }
        else if (currentGas.equals("Ammonia")) {
          inContainer.add(new Ammonia(temp, random(480,400+Width-80), random(180,100+Height-80)));
        }
      }
    }
    else{
      //if(Math.abs(numParticles)>=inContainer.size()){
      //  throw new IllegalArgumentException();
      //}
      int num = 0;
      //int currNumMoles = numMoles;
      for (int n = 0; n < numMoles; n++) {
        if (num >= Math.abs(numParticles)) {
          break;
        }
        if (inContainer.get(n).getName().equals(currentGas)) {
          inContainer.remove(n);
          n -= 1;
          num += 1;
        }
      }
    }
    numMoles = inContainer.size();
  }
  
  void display(){
    fill(180, 250, 250);
    rect(400, 100, Width, Height);
  }
  
  //public float calcPressure() {
  //  if (isIdeal) {
  //    float P = (moles*IGC*temp)/getVolume();
  //    return P;
  //  }
    
  //  else {
      
  //  }
  //}
    
  
}
