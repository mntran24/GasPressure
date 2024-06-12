class Ammonia extends Particle{
  color default_color;
  
  Ammonia(float temp, float x, float y){
    super("Ammonia", 17.034, temp, 4.225, 0.03713, x, y, color(81, 237, 143), 16);

  }
  void move(){
    super.move();
  }
  void bounce(){
    super.bounce();
  }
  void bounceAgainstParticle(ArrayList<Particle> other){
    super.bounceAgainstParticle(other, 0.3);
  }
  void display(){
    super.display();
  }
  
  public String getName() {
    return name;
  }
}
