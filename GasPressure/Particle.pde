class Particle{
  float molarMass, temperature, a, b;
  PVector velocity, location;
  color default_color;
  float radius;
  String name;
  Particle(String n, float mm, float temp, float a_val, float b_val, float x, float y, color default_color, float rad){
    molarMass = mm;
    temperature = temp;
    a = a_val;
    b = b_val;
    location = new PVector(x,y);
    double speed = Math.sqrt((8*8.3144*temperature)/(3.14*molarMass))/5;
    int head = (int)random(1,359);
    velocity = new PVector((float)(speed*cos(head)),(float)(speed*sin(head)));
    this.default_color = default_color;
    //default_color = color(142,100,209);
    radius = rad;
    name = n;
  }
  
  String getName() {
    return name;
  }
  //private PVector calcVelocity(){
  //}
  
  //void applyForce(PVector force){
  //  PVector f = force.div(molarMass);
  //  acceleration.add(f);
  //}
  
  void move(){
    location.add(velocity);
  }
  
  void bounce(float accelFactor){
    if(location.x >= (750 ) || location.x <= (400 )){
      velocity.x *= -1 * accelFactor * velocity.x;
    }
    if(location.y >= (700 ) || location.y <= (100 )){
      velocity.y *= -1 * accelFactor * velocity.y;
    }
  }
  
  void bounceAgainstParticle(Particle other, float imf){

    PVector v1 = velocity;
    PVector v2 = other.velocity;
    
    PVector loc1 = location;
    PVector loc2 = other.location;
    
    // Current distance between the centers of the particles (use distance formula)
    float currDistBtwnCenters = loc1.sub(loc2).mag();//Math.sqrt(Math.pow(loc1.x - loc2.x, 2) + Math.pow(loc1.y - loc2.y, 2));
    
    // Distance between centers of particles when tangent to each other 
    float distBtwnCenters = radius + other.radius;
    
    if (currDistBtwnCenters <= distBtwnCenters) {
      //if (molarMass >= other.molarMass) {
      //  v1.mult(-1 * other.molarMass * n);
      //  v2.mult(-1 * molarMass * n);
        
      //}
      //else {
      //  v1.mult(-1 * molarMass * n);
      //  v2.mult(-1 * other.molarMass * n);
      //}
      float dx = loc1.x - loc2.x;
      float dy = loc1.y - loc2.y;
      float angle = atan2(dy, dx);
      float changeX = loc1.x + cos(angle)*distBtwnCenters;
      float changeY = loc1.y + sin(angle)*distBtwnCenters;
      
      float changeVx = (changeX - loc2.x) * n;
      float changeVy = (changeY - loc2.y) * n;
      
      v1.x -= changeVx;
      v1.y -= changeVy;
      v2.x += changeVx;
      v2.y += changeVy;
    }

    
    
    
    //PVector dist = PVector.sub(other.location, location);
    //float distMag = dist.mag();
    //float termDist = 50*b*molarMass+50*other.b*other.molarMass;
    //if(distMag<termDist){
    //  float correct = (termDist-distMag)/2.0;
    //  PVector cor = dist.copy();
    //  PVector correctVect = cor.normalize().mult(correct);
    //  other.location.add(correctVect);
    //  location.sub(correctVect);
      
    //  float angle = dist.heading();
    //  float sine = sin(angle);
    //  float cosine = cos(angle);
      
    //  PVector[] tempPos={
    //    new PVector(), new PVector()
    //  };
    //  tempPos[1].x=cosine*dist.x+sine*dist.y;
    //  tempPos[1].y=cosine*dist.y-sine*dist.x;
      
    //  PVector[] tempVel = {
    //    new PVector(), new PVector()
    //  };
    //  tempVel[0].x=cosine*velocity.x+sine*velocity.y;
    //  tempVel[0].y=cosine*velocity.y-sine*velocity.x;
    //  tempVel[1].x=cosine*other.velocity.x+sine*other.velocity.y;
    //  tempVel[1].y=cosine*other.velocity.y-sine*other.velocity.x;
      
    //  PVector[] finalVel={
    //    new PVector(), new PVector()
    //  };
    //  finalVel[0].x = ((molarMass - other.molarMass)*tempVel[0].x+2*other.molarMass*tempVel[1].x)/(molarMass+other.molarMass);
    //  finalVel[0].y = tempVel[0].y;
      
    //  finalVel[1].x = ((other.molarMass - molarMass)*tempVel[1].x+2*molarMass*tempVel[0].x)/(molarMass+other.molarMass);
    //  finalVel[1].y = tempVel[1].y;
      
    //  tempPos[0].x+=finalVel[0].x;
    //  tempPos[1].x+=finalVel[1].x;
      
    //  PVector[] finalPos = {
    //    new PVector(), new PVector()
    //  };
    //  finalPos[0].x = cosine * tempPos[0].x - sine * tempPos[0].y;
    //  finalPos[0].y = cosine * tempPos[0].y + sine * tempPos[0].x;
    //  finalPos[1].x = cosine * tempPos[1].x - sine * tempPos[1].y;
    //  finalPos[1].y = cosine * tempPos[1].y + sine * tempPos[1].x;

    //  // update balls to screen position
    //  other.location.x = location.x + finalPos[1].x;
    //  other.location.y = location.y + finalPos[1].y;

    //  location.add(finalPos[0]);

    //  // update velocities
    //  velocity.x = cosine * finalVel[0].x - sine * finalVel[0].y;
    //  velocity.y = cosine * finalVel[0].y + sine * finalVel[0].x;
    //  other.velocity.x = cosine * finalVel[1].x - sine * finalVel[1].y;
    //  other.velocity.y = cosine * finalVel[1].y + sine * finalVel[1].x;
    //          //work in progress
    //}  
  }
  
  void display(){
    stroke(1);
    strokeWeight(2);
    fill(default_color);
    ellipse(location.x, location.y, radius, radius);
  }
}
