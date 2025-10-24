class Banana
{
  int x;
  int y;
  int counter = 0;
  //PImage banana;
  PImage banana1, banana2, banana3;


  Banana (int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    //banana = loadImage("banana.png");
    //banana.resize(30, 25);
    //image (banana, x, y);
    banana1 = loadImage("banana1.png");
    banana2 = loadImage("banana2.png");
    banana3 = loadImage("banana3.png");

    if (counter < 20) { 
      image(banana1, x, y);
    } else if (counter < 30) { 
      image(banana2, x, y);
    } else { 
      image(banana3, x, y);
      counter=0;
    }

    counter++;
  }
}
