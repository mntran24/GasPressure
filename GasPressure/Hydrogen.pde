
float aHydrogen = 0.2453;
float bHydrogen = 0.02651;
float mmHydrogen = 2.016;
class Hydrogen extends Particle{
  Hydrogen(float temp, float x, float y){
    super(mmHydrogen, temp, aHydrogen, bHydrogen, x, y, color(245, 64, 73));
    gasType = "Hydrogen";
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
