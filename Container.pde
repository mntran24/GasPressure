float Height = 10;
float Width = 5; 
float temp = 298;
float IGC = 0.08206;
float pressure;
float moles; 
color c;
boolean isIdeal = true;
Particle[] inContainer; 

public Container(float P, float numMoles, boolean isIdeal, Particle[] addedGas) {
  pressure = P;
  moles = numMoles;
  this.isIdeal = isIdeal;
  inContainer = addedGas;
}

public void setTemp(float newTemp) {
  this.temp = newTemp;
}

public void setHeight(float newVol) {
  this.Height = newVol;
}

//public setWidth(float newVol) {
//  this.Height = newVol;
//}

public float getTemp() {
  return temp;
}

public float getMoles() {
  return moles;
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

public float calcPressure() {
  if (isIdeal) {
    float P = (moles*IGC*temp)/getVolume();
    return P;
  }
  
  else {
    
  }
}

void setup() {
  size(1000, 800);
  rect(500, 400, getWidth(), getHeight());
}
void display() {
  
}
