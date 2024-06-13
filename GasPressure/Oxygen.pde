
float aOxygen = 1.382;
float bOxygen = 0.03186;
float mmOxygen = 32;
class Oxygen extends Particle{
  Oxygen(float temp, float x, float y){
    super(mmOxygen, temp, aOxygen, bOxygen, x, y,color(55, 102, 196));
    gasType = "Oxygen";
  }
  void move(){
    super.move();
  }
  void bounce(int vol){
    super.bounce(vol);
  }
  void bounceAgainstParticle(Particle other){
    super.bounceAgainstParticle(other);
  }
  void display(){
    super.display();
  }
}
