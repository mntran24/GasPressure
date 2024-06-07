

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
  
  public ArrayList<Particle> getContainer() {
    return inContainer;
  }
  
  void updateParticle(int numParticles, String currentGas){
    if (numParticles > 0) {
      for (int n = 0; n < Math.abs(numParticles); n++) {
        if (currentGas.equals("Hydrogen")) {
          inContainer.add(new Hydrogen(temp, random(415,400+Width), random(115,100+Height)));
        }
        else if (currentGas.equals("Oxygen")) {
          inContainer.add(new Oxygen(temp, random(415,400+Width), random(115,100+Height)));
        }
        else if (currentGas.equals("Ammonia")) {
          inContainer.add(new Ammonia(temp, random(415,400+Width), random(115,100+Height)));
        }
      }
    }
    else {
      if(Math.abs(numParticles)>=inContainer.size()){
        throw new IllegalArgumentException();
      }
      for (int n = 0; n < Math.abs(numParticles); n++) {
        inContainer.remove(0);
      }
    }
    numMoles = inContainer.size();
  }
  
  
  public void setTemp(float newTemp) {
    this.temp = newTemp;
  }
  
  public void setHeight(float newVol) {
    this.Height = newVol;
  }
  
  public void setWidth(float newVol) {
    this.Height = newVol;
  }
  
  public float getTemp() {
    return temp;
  }
  
  public int getMoles() {
    return numMoles;
  }
  
  public float getVolume() {
    return Height*Width;
  }
  
  public float getHeight() {
    return Height;
  }
  
  public float getWidth() {
    return Width;
  }
  
  //public float calcPressure() {
  //  if (isIdeal) {
  //    float P = (numMoles*IGC*temp)/getVolume();
  //    return P;
  //  }
    
  //  else {
      
      
  //  }
  //}
    
  
}
