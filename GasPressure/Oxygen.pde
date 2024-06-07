class Oxygen extends Particle{
  color default_color;
  Oxygen(float temp, float x, float y){
    super(32, temp, 1.382, 0.03186, x, y,color(55, 102, 196));
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
}
