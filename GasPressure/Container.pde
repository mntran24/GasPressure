import com.krab.lazy.*;

class Container {
  float Height = 600;
  float Width = 350; 
  float temp = 298;
  float IGC = 0.08206;
  float pressure;
  float moles; 
  color c;
  boolean isIdeal = true;
  //Particle[] inContainer; 
  
  Container(float P, float numMoles, boolean isIdeal) {
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
  
  public void setWidth(float newVol) {
    this.Height = newVol;
  }
  
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
    
  
}

LazyGui gui; 
Container test;

void setup() {
  size(1000, 800, P2D);
  test = new Container(2, 15, true);
  gui = new LazyGui(this);
}



// Hydrogen atom = blue 
// Oxygen atom = green
// Nitrogen atom = red
void drawHydrogen(int x, int y) {
  fill(0,0,175); //Fill color to blue
  circle(x-7.5, y, 15);
  circle(x+7.5, y, 15);
}

void drawOxygen(int x, int y) {
  fill(0,175,0); //Fill color to green
  circle(x-12.5, y, 25);
  circle(x+12.5, y, 25);
}

void drawAmmonia(int x, int y) {
  fill(0,0,175); //Fill color to blue
  circle(x-17, y-5, 15);
  circle(x-10, y+18, 15);
  circle(x+15, y+15, 15);
  
  fill(175,0,0); //Fill color to red
  circle(x, y, 28);
}

void draw() {
  background(255);
  fill(180, 250, 250);
  rect(400, 100, test.getWidth(), test.getHeight());
  
  Hydrogen p1 = new Hydrogen(test.getTemp(), 100, 100);
  p1.display();
  
  //Oxygen p2 = new Oxygen(test.getTemp(), 200, 200);
  //p2.display();
  
  //Ammonia p3 = new Ammonia(test.getTemp(), 300, 300);
  //p3.display();
  
  // Volume Slider 
  float currentVolume = gui.slider("Volume", 4, 4, 10);
  gui.sliderSet("Volume", currentVolume);
  

  int numParticles = gui.sliderInt("Num of Particles", 250, 0, 1000);
  
  // Toggle between gas types
  String[] gasTypes = {"Hydrogen", "Oxygen", "Ammonia"};
  String currentGas = gui.radio("Type of Gas", gasTypes);
   //Default gas type
  gui.radio("Type of Gas", gasTypes, "Hydrogen");
  
  //Display all particles (can change the particles no matter where each one is)
  
  for (int n = 0; n < numParticles; n++) {
    if (currentGas.equals("Hydrogen")) {
      
    }
    else if (currentGas.equals("Oxygen")) {
    
    }
    else if (currentGas.equals("Ammonia")) {
    
    }
  }
  
  
}
