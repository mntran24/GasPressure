//class Hydrogen extends Particle{
//  color default_color;

//  Hydrogen(float temp, float x, float y){
//    super("Hydrogen", 2.016, temp, 0.2453, 0.02651, x, y, color(245, 64, 73), 53/5);
//    name = "Hydrogen";
//  }
//  void move(){
//    super.move();
//  }
//  void bounce(){
//    super.bounce();
//  }
//  void bounceAgainstParticle(ArrayList<Particle> other){
//    super.bounceAgainstParticle(other, 0.5);
//  }
//  void collision(Particle other){
//    super.collision(other);
//  }
//  void display(){
//    super.display();
//  }
  
//  public String getName() {
//    return name;
//  }
//}


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
