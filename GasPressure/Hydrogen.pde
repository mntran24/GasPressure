class Hydrogen extends Particle{
  color default_color;
  Hydrogen(float temp, float x, float y){
    super(2.016, temp, 0.2453, 0.02651, x, y, color(245, 64, 73));
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
