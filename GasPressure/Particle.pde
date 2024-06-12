class Particle{
  float molarMass, temperature, a, b;
  PVector velocity, location;
  color default_color;
  float radius;
  String name;
  ArrayList<Particle> others;
  int index;
  Particle prevCollision;
  //Container test;
  
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

    others = new ArrayList<Particle>();
    index = 0;
    prevCollision = null;

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
  
  void bounce(){
    if(location.x >= (745-400*b) || location.x <= (410+400*b)){
      velocity.x *= -1; 
      prevCollision = null;
    }
    if(location.y >= (695-400*b) || location.y <= (130+400*b)){
      velocity.y *= -1; 
      prevCollision = null;
    }
  }
  
  void collision(Particle other) {
    PVector diffInLoc = other.location.sub(location);
    
    //Velocity comp in direction of collision
    float mag = diffInLoc.mag();
    PVector dirOfCollision = diffInLoc.mult(diffInLoc.dot(velocity)/mag);
    
    //Velocity comp in tangent of collision
    PVector dirOfTangCollision = velocity.sub(dirOfCollision);
    
    PVector diffInLoc2 = location.sub(other.location);
    PVector dirOfCollision2 = diffInLoc2.mult(diffInLoc2.dot(other.velocity)/diffInLoc2.mag());
    
    PVector newV = dirOfCollision.mult((molarMass-other.molarMass)/(molarMass+other.molarMass)).add(dirOfCollision2.mult(2*other.molarMass/(molarMass+other.molarMass)));
    
    velocity = newV.add(dirOfTangCollision);
    
    prevCollision = other;
  }
  void bounceAgainstParticle(ArrayList<Particle> others, float imf){
    
    //// Current distance between the centers of the particles (use distance formula)
    //float currDistBtwnCenters = location.sub(other.location).mag();//Math.sqrt(Math.pow(loc1.x - loc2.x, 2) + Math.pow(loc1.y - loc2.y, 2));
    
    //// Distance between centers of particles when tangent to each other 
    //float distBtwnCenters = radius + other.radius;
    
    //if (currDistBtwnCenters <= distBtwnCenters) {
    //  //if (molarMass >= other.molarMass) {
    //  //  v1.mult(-1 * other.molarMass * n);
    //  //  v2.mult(-1 * molarMass * n);
        
    //  //}
    //  //else {
    //  //  v1.mult(-1 * molarMass * n);
    //  //  v2.mult(-1 * other.molarMass * n);
    //  //}
    //  float dx = location.x - other.location.x;
    //  float dy = location.y - other.location.y;
    //  float angle = atan2(dy, dx);
    //  float changeX = location.x + cos(angle)*distBtwnCenters;
    //  float changeY = location.y + sin(angle)*distBtwnCenters;
      
    //  float changeVx = (changeX - other.location.x) * imf;
    //  float changeVy = (changeY - other.location.y) * imf;
      
      
    //  velocity.x -= changeVx;
    //  velocity.x *= -1;
    //  velocity.y -= changeVy;
    //  velocity.y *= -1;
      
      
    //  other.velocity.x += changeVx;
    //  other.velocity.x *= -1;
      
    //  other.velocity.y += changeVy;
    //  other.velocity.y *= -1;
      
    //  bounce();
    //  other.bounce();
      
    //}
    //  constrain(location.x,0, width/2);
      //constrain(location.y,0, heigth==);
    
    for (int n = 0; n < others.size()-1; n++) {
      if(location.x >= (750-400*b) || location.x <= (400+400*b)){
        velocity.x *= -1; //* accelFactor;
      }
      if(location.y >= (700-400*b) || location.y <= (100+400*b)){
        velocity.y *= -1; // * accelFactor;
      }
      float currDistBtwnCenters = location.sub(others.get(n).location).mag();
      // Distance between centers of particles when tangent to each other 
      float distBtwnCenters = radius + others.get(n).radius;
      
      for (int k = n+1; k < others.size(); k++) {
        if (currDistBtwnCenters < distBtwnCenters) {
          float dx = location.x - others.get(n).location.x;
          float dy = location.y - others.get(n).location.y;
          float angle = atan2(dy, dx);
          
          PVector changeLoc1 = new PVector(-1*cos(angle)*velocity.x/20, -1*sin(angle)*velocity.y/20);
          PVector changeLoc2 = new PVector(-1*cos(angle)*others.get(n).velocity.x/20, -1*sin(angle)*others.get(n).velocity.y/20);
          
          PVector new1 = location.add(changeLoc1);
          PVector new2 = others.get(n).location.add(changeLoc2);
          if(new1.x >= (750-400*b) || new1.x <= (400+400*b)){
            velocity.x *= -1; //* accelFactor;
          }
          if(new1.y >= (700-400*b) || new1.y <= (100+400*b)){
            velocity.y *= -1; // * accelFactor;
          }
          
          if(new2.x >= (750-400*b) || new2.x <= (400+400*b)){
            velocity.x *= -1; //* accelFactor;
          }
          if(new2.y >= (700-400*b) || new2.y <= (100+400*b)){
            velocity.y *= -1; // * accelFactor;
          }
          
          else {
            location.add(changeLoc1);
            others.get(n).location.add(changeLoc2);
          }
        //velocity.x = imf*cos(angle)*(velocity.x - (2*others.get(n).molarMass*others.get(n).molarMass)*(velocity.x - others.get(n).velocity.x)/(molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass)) - 2*others.get(n).velocity.x;
        //velocity.y = imf*cos(angle)*(velocity.y - (2*others.get(n).molarMass*others.get(n).molarMass)*(velocity.y - others.get(n).velocity.y)/(molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass)) - 2*others.get(n).velocity.y;
        
        //others.get(n).velocity.x = imf*cos(angle)*(2*others.get(n).molarMass*others.get(n).molarMass*(velocity.x - others.get(n).velocity.x)/(others.get(n).molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass));
        //others.get(n).velocity.y = imf*sin(angle)*(2*others.get(n).molarMass*others.get(n).molarMass*(velocity.y - others.get(n).velocity.y)/(others.get(n).molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass));
        
        //if(new1.x >= (750-400*b) || new1.x <= (400+400*b)){
        //  velocity.x = -1*imf*cos(angle)*(velocity.x - (2*others.get(n).molarMass*others.get(n).molarMass)*(velocity.x - others.get(n).velocity.x)/(molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass)) - 2*others.get(n).velocity.x;
        //}
        //if(new1.y >= (700-400*b) || new1.y <= (100+400*b)){
        //  velocity.y = -1*imf*cos(angle)*(velocity.y - (2*others.get(n).molarMass*others.get(n).molarMass)*(velocity.y - others.get(n).velocity.y)/(molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass)) - 2*others.get(n).velocity.y;
        //}
        
        //if(new2.x >= (750-400*b) || new2.x <= (400+400*b)){
        //  others.get(n).velocity.x = -1*imf*cos(angle)*(2*others.get(n).molarMass*others.get(n).molarMass*(velocity.x - others.get(n).velocity.x)/(others.get(n).molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass));
        //}
        //if(new2.y >= (700-400*b) || new2.y <= (100+400*b)){
        //  others.get(n).velocity.y = -1*imf*sin(angle)*(2*others.get(n).molarMass*others.get(n).molarMass*(velocity.y - others.get(n).velocity.y)/(others.get(n).molarMass*others.get(n).molarMass + others.get(n).molarMass*others.get(n).molarMass));
        //}
        }
      }
      
    }
    // Current distance between the centers of the particles (use distance formula)
    
      
      
      
      
      
      
    //  PVector dist = PVector.sub(other.location, location);
    //  float distMag = dist.mag() + imf;
    //  float termDist = 200*b+200*other.b;
    //  if(distMag<termDist){
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
    beginContour();
    ellipse(location.x, location.y, radius, radius);
    endContour();
  }
}
