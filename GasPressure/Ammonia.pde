

float aAmmonia = 4.225;
float bAmmonia = 0.03713;
float mmAmmonia = 17.034;
class Ammonia extends Particle{
  Ammonia(float temp, float x, float y){
    super(mmAmmonia, temp, aAmmonia, bAmmonia, x, y, color(81, 237, 143));
    gasType = "Ammonia";
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
