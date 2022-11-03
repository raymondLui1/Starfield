Particle [] star = new Particle[250];
int click = 0;
void setup()
{
  size(1000, 1000);
  background(0);
  for(int i = 0; i < 5; i++)
    star[i] = new OddballParticle();
  for(int i = 5; i < star.length; i++)
    star[i] = new Particle();
}
void draw()
{
  background(0);
  for(int i = 0; i < star.length; i++)
  {
    star[i].show();
    star[i].move();
  }
}
class Particle
{
  double starX, starY, starA, starBaseA, starS;
  int starBody, starC;
  Particle()
  {
      starX = 500.0;
      starY = 500.0;
      starA = (Math.random()*2)*PI;
      starBaseA = starA;
      starS = Math.random()*10;
      starBody = 10;
      starC = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }

  void move()
  {
    if(click == 0 || (click%2 == 0 && click%5 != 0))
    {
      starX = starX + (Math.cos(starA) * starS);
      starY = starY + (Math.sin(starA) * starS);
    }
    if(click%2 == 1 && click%5 != 0)
    {
      starX = starX - (Math.cos(starA) * starS);
      starY = starY - (Math.sin(starA) * starS);
    }
    if(click != 0 && click%5 == 0 && click%10 != 0 && starBody == 10)
    {
      starX = starX + (Math.cos(starA) * starS);
      starY = starY + (Math.sin(starA) * starS);
      starA += PI/120;
    }
    if(click != 0 && click%10 == 0 && starBody == 10)
    {
      starX = starX - (Math.cos(starA) * starS);
      starY = starY - (Math.sin(starA) * starS);
      starA -= PI/120;
    }
    if(click != 0 && click%5 == 0 && click%10 != 0 && starBody == 50)
    {
      starX = starX + (Math.cos(starA) * starS);
      starY = starY + (Math.sin(starA) * starS);
      starA -= PI/120;
    }
    if(click != 0 && click%10 == 0 && starBody == 50)
    {
      starX = starX - (Math.cos(starA) * starS);
      starY = starY - (Math.sin(starA) * starS);
      starA += PI/120;
    }
  }
 
  void show()
  {
    fill(starC);
    ellipse((float)starX, (float)starY, starBody, starBody);
  }

}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle()
  {
    starX = 500.0;
    starY = 500.0;
    starA = (Math.random()*2)*PI;
    starBaseA = starA;
    starS = Math.random()*5;
    starBody = 50;
    starC = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  } 
}

void mousePressed()
{
  click++;
}
