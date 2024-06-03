class Oxygen extends Particle{
  color default_color;
  Oxygen(float temp, float x, float y){
    super(32, temp, 1.382, 0.03186, x, y);
    default_color = color(55, 102, 196);
  }
}
