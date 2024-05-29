class Particle{
  float molarMass, temperature, a, b;
  PVector velocity, acceleration, location;
  color default_color;
  Particle(float mm, float temp, float a_val, float b_val, float x, float y){
    molarMass = mm;
    temperature = temp;
    a = a_val;
    b = b_val;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    default_color = color(142,100,209);
  }
  
  //private PVector calcVelocity(){
  //}
  
  
  
  void applyForce(PVector force){
    PVector f = force.div(molarMass);
    acceleration.add(f);
  }
  
  void move(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void bounce(){
    if(location.x>width-500*b*molarMass|| location.x<500*b*molarMass){
      velocity.x*=-1;
    }
    if(location.y>height-500*b*molarMass || location.y<500*b*molarMass){
      velocity.y*=-1;
    }
  }
  
  void bounceAgainstParticle(Particle other){
    PVector dist = PVector.sub(other.location, location);
    float distMag = dist.mag();
    float termDist = 500*b*molarMass+500*other.b*other.molarMass;
    if(distMag<termDist){
      float correct = (termDist-distMag)/2.0;
      PVector cor = dist.copy();
      PVector correctVect = 
  }
  
  void display(){
    stroke(1);
    strokeWeight(2);
    fill(default_color);
    ellipse(location.x, location.y, 1000*b * molarMass, 1000*b * molarMass);
  }
}
