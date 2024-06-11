class Oxygen extends Particle{
  color default_color;

  Oxygen(float temp, float x, float y){
    super("Oxygen", 32, temp, 1.382, 0.03186, x, y,color(55, 102, 196), 60);

  }
  void move(){
    super.move();
  }
  void bounce(){
    super.bounce();
  }
  void bounceAgainstParticle(float imf){
    super.bounceAgainstParticle(imf);
  }
  void display(){
    super.display();
  }
  
  public String getName() {
    return name;
  }
}
