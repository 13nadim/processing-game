class Monkey
{
  int x;
  int y;
  PImage monkey;

  Monkey (int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    monkey = loadImage("monkey.png");
    monkey.resize(50, 60);
    image (monkey, x, y);
  }

  boolean eat(Banana banana) {
    return abs(this.x - banana.x) < 25 && abs(this.y - banana.y) < 30;
  }

  boolean meets(Snake snake) {
    return abs(this.x - snake.x) < 25 && abs(this.y - snake.y) < 25;
  }
}
