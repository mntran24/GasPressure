class Particle{
  float molarMass, temperature, a, b;
  PVector velocity, location;
  color default_color;
  String gasType = "default";
  Particle(float mm, float temp, float a_val, float b_val, float x, float y, color default_color){
    molarMass = mm;
    temperature = temp;
    a = a_val;
    b = b_val;
    location = new PVector(x,y);
    double speed = Math.sqrt((8*8.3144*temperature)/(3.14*molarMass))/5;
    int head = (int)random(1,359);
    velocity = new PVector((float)(speed*cos(head)),(float)(speed*sin(head)));
    this.default_color = default_color;
  }
  
  void move(){
    location.add(velocity);
  }
  
  void bounce(int newVolHeight){
    if(location.x>745-200*b|| location.x<405+200*b){
      velocity.x*=-1;
    }
    if(location.y>695-200*b || location.y<105+(600-newVolHeight)+200*b){
      velocity.y*=-1;
    }
    if(location.x>746-200*b){
      //velocity.x*=-1;
      location.x-=1;
    }
    if(location.x<404+200*b){
      //velocity.x*=-1;
      location.x+=1;
    }
    if(location.y<103+(600-newVolHeight)+200*b){
      //velocity.x*=-1;
      location.y+=1;
    }
    if(location.y>696-200*b){
      //velocity.x*=-1;
      location.y-=1;
    }
  }
  
  void bounceAgainstParticle(Particle other){
    PVector v1 = velocity;
    PVector v2 = other.velocity;
    
    PVector loc1 = location;
    PVector loc2 = other.location;
    
    // Current distance between the centers of the particles (use distance formula)
    double currDistBtwnCenters = Math.sqrt(Math.pow(loc1.x - loc2.x, 2) + Math.pow(loc1.y - loc2.y, 2));
    
    // Distance between centers of particles when tangent to each other 
    double distBtwnCenters = radius + other.radius;
    
    // Split up velocity vector into x and y comp
    float angle1 = Math.atan(loc1.y/loc1.x);  //FIX DIVISION 
    float angle2 = Math.atan(loc2.y/loc2.x);
    
    float v1x = v1*cos(angle1);
    float v1y = v1*sin(angle1);
    float v2x = v2*cos(angle2);
    float v2y = v2*sin(angle2);
    
    if (currDistBtwnCenters <= distBtwnCenters) {
      
    }
    
    
    
    PVector dist = PVector.sub(other.location, location);
    float distMag = dist.mag();
    float termDist = 200*b+200*other.b;
    if(distMag<termDist){
      float correct = (termDist-distMag)/2.0;
      PVector cor = dist.copy();
      PVector correctVect = cor.normalize().mult(correct);
      other.location.add(correctVect);
      location.sub(correctVect);
      
      float angle = dist.heading();
      float sine = sin(angle);
      float cosine = cos(angle);
      
      PVector[] tempPos={
        new PVector(), new PVector()
      };
      tempPos[1].x=cosine*dist.x+sine*dist.y;
      tempPos[1].y=cosine*dist.y-sine*dist.x;
      
      PVector[] tempVel = {
        new PVector(), new PVector()
      };
      tempVel[0].x=cosine*velocity.x+sine*velocity.y;
      tempVel[0].y=cosine*velocity.y-sine*velocity.x;
      tempVel[1].x=cosine*other.velocity.x+sine*other.velocity.y;
      tempVel[1].y=cosine*other.velocity.y-sine*other.velocity.x;
      
      PVector[] finalVel={
        new PVector(), new PVector()
      };
      finalVel[0].x = ((molarMass - other.molarMass)*tempVel[0].x+2*other.molarMass*tempVel[1].x)/(molarMass+other.molarMass);
      finalVel[0].y = tempVel[0].y;
      
      finalVel[1].x = ((other.molarMass - molarMass)*tempVel[1].x+2*molarMass*tempVel[0].x)/(molarMass+other.molarMass);
      finalVel[1].y = tempVel[1].y;
      
      tempPos[0].x+=finalVel[0].x;
      tempPos[1].x+=finalVel[1].x;
      
      PVector[] finalPos = {
        new PVector(), new PVector()
      };
      finalPos[0].x = cosine * tempPos[0].x - sine * tempPos[0].y;
      finalPos[0].y = cosine * tempPos[0].y + sine * tempPos[0].x;
      finalPos[1].x = cosine * tempPos[1].x - sine * tempPos[1].y;
      finalPos[1].y = cosine * tempPos[1].y + sine * tempPos[1].x;

      // update balls to screen position
      other.location.x = location.x + finalPos[1].x;
      other.location.y = location.y + finalPos[1].y;

      location.add(finalPos[0]);

      // update velocities
      velocity.x = cosine * finalVel[0].x - sine * finalVel[0].y;
      velocity.y = cosine * finalVel[0].y + sine * finalVel[0].x;
      other.velocity.x = cosine * finalVel[1].x - sine * finalVel[1].y;
      other.velocity.y = cosine * finalVel[1].y + sine * finalVel[1].x;
              
    }  
  }
  
  void display(){
    stroke(1);
    strokeWeight(2);
    fill(default_color);
    ellipse(location.x, location.y, 400*b, 400*b);
  }
}
