class Oxygen extends Particle{
  Oxygen(float temp, float x, float y){
    super(32, temp, 1.382, 0.03186, x, y,color(55, 102, 196));
    gasType = "Oxygen";
  }
  void move(){
    super.move();
  }
  void bounce(){
    super.bounce();
  }
  void bounceAgainstParticle(Particle other){
    super.bounceAgainstParticle(other);
  }
  void display(){
    super.display();
  }
  String gasType(){
    return super.gasType();
  }
}
