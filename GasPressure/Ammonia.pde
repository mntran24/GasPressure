class Ammonia extends Particle{
  Ammonia(float temp, float x, float y){
    super(17.034, temp, 4.225, 0.03713, x, y, color(81, 237, 143));
    gasType = "Ammonia";
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
