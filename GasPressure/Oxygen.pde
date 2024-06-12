//class Oxygen extends Particle{
//  color default_color;

//  Oxygen(float temp, float x, float y){
//    super("Oxygen", 32, temp, 1.382, 0.03186, x, y,color(55, 102, 196), 12);

//  }
//  void move(){
//    super.move();
//  }
//  void bounce(){
//    super.bounce();
//  }
//  void bounceAgainstParticle(ArrayList<Particle> other){
//    super.bounceAgainstParticle(other, 0.9);
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
