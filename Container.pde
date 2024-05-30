import com.krab.lazy.*;

LazyGui gui; 

float Height = 200;
float Width = 200; 
float temp = 298;
float IGC = 0.08206;
float pressure;
float moles; 
color c;
boolean isIdeal = true;
//Particle[] inContainer; 

public Container(float P, float numMoles, boolean isIdeal) {
  pressure = P;
  moles = numMoles;
  this.isIdeal = isIdeal;
  //inContainer = addedGas;
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

//public float calcPressure() {
//  if (isIdeal) {
//    float P = (moles*IGC*temp)/getVolume();
//    return P;
//  }
  
//  else {
    
//  }
//}

void setup() {
  size(1000, 800);
  rect(500, 400, this.getWidth(), this.getHeight());
  gui = new LazyGui(this);
}
void display() {
  // Volume Slider 
  float currentVolume = gui.slider("Volume", 4, 4, 10);
  
  
  // Toggle between gas types
  String[] gasTypes = {"Hydrogen", "Oxygen", "Ammonia"};
  String currentGas = gui.radio("Type of Gas", gasTypes);
  if (currentGas.equals("Hydrogen")) {
    
  }
  else if (currentGas.equals("Oxygen")) {
    
  }
  else if (currentGas.equals("Ammonia")) {
    
  }
  
  //Default gas type
  gui.radio("Type of Gas", gasTypes, "Hydrogen");
  
  
  
}
