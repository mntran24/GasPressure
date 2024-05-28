class Hydrogen extends Particle{
  color default_color;
  Hydrogen(float temp, float x, float y){
    super(2.016, temp, 0.2453, 0.02651, x, y);
    default_color = color(245, 64, 73);
  }
}
