class Snake
{
  int x;
  int y;
  int counter = 0;
  PImage snake1, snake2, snake3, snake4;

  Snake (int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    snake1 = loadImage("snake1.png");
    snake1.resize(50, 50);
    snake2 = loadImage("snake2.png");
    snake2.resize(50, 50);
    snake3 = loadImage("snake3.png");
    snake3.resize(50, 50);
    snake4 = loadImage("snake4.png");
    snake4.resize(50, 50);

    if (counter < 10) { 
      image(snake1, x, y);
    } else if (counter < 20) { 
      image(snake2, x, y);
    } else if (counter < 30) { 
      image(snake3, x, y);
    } else { 
      image(snake4, x, y);
      counter=0;
    }

    counter++;
  }
}
