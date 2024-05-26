class Particle{
  float molarMass, temperature, a, b;
  PVector velocity, acceleration, location;
  color default_color = color(142,100,209);
  Particle(float mm, float temp, float a_val, float b_val, float x, float y){
    molarMass = mm;
    temperature = temp;
    a = a_val;
    b = b_val;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  private PVector calcVelocity(){
  }
  
  void applyForce(PVector force){
    PVector f = force.div(mass);
    acceleration.add(f);
  }
  
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void bounce(){
    if(location.x>width-25*molarMass|| location.x<25*molarMass){
      velocity.x*=-1;
    }
    if(location.y>height-25*molarMass || location.y<25*molarMass){
      velocity.y*=-1;
    }
  }
  
  void display(){
    stroke(1);
    strokeWeight(2);
    fill(default_color);
    ellipse(location.x, location.y, 50 * molarMass, 50 * molarMass);
  }
}
