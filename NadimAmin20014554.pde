PImage bg;

final int OFF = 0;
final int ON = 1;
int gameStatus = OFF;

int score = 0;
int numOfBananasRemaining = 6;

Monkey player1;

ArrayList<Banana> bananaList = new ArrayList();
ArrayList<Snake> snakeList = new ArrayList();

CountDown timer;

void setup()
{
  size(600, 400);
  bg = loadImage("rainforestBackground.png");
  bg.resize(width, height);
  image (bg, 0, 0);
  textSize(50);
  fill(225);
  text("BANANA MONKEY", 85, 170);
  textSize(15);
  fill(249);
  text("Press 'spacebar' to start.", 220, 195);

  player1 = new Monkey(1, 215);

  //for (int i = 0; i < 1; i++)
  //{
  //  bananaList.add(new Banana((int)random(70, 565), (int)random(220, 370)));
    bananaList.add(new Banana(85, 280));
    bananaList.add(new Banana(180, 260));
    bananaList.add(new Banana(305, 220));
    bananaList.add(new Banana(340, 320));
    bananaList.add(new Banana(555, 260));
    bananaList.add(new Banana(555, 320));
  //}

  //for (int i = 0; i < 3; i++)
  //{
  //  snakeList.add(new Snake((int)random(70, 565), (int)random(220, 370)));
    snakeList.add(new Snake(260, 270));
    snakeList.add(new Snake(380, 220));
    snakeList.add(new Snake(460, 290));
  //}
  timer = new CountDown(60);
}

void drawBackground()
{
  image (bg, 0, 0);
}

void draw()
{
  if (gameStatus == ON)
  {
    {
      drawBackground();

      textSize(12.5);
      text("score: " + score, 539, 26);
      text("timer: " + timer.getRemainingTime(), 540, 13);

      player1.render();

      for (int i = 0; i < bananaList.size(); i++)
      {
        bananaList.get(i).render();
        if (player1.eat(bananaList.get(i))) {
          bananaList.remove(i);
          score = score + 1;
          numOfBananasRemaining = numOfBananasRemaining - 1;
        }
      }
      println( bananaList.size());

      for (int i = 0; i < snakeList.size(); i++)
      {
        snakeList.get(i).render();
        if (player1.meets(snakeList.get(i))) {
          background(0);
          textSize(50);
          text("GAME OVER", 150, 200);
        }
      }

      if (numOfBananasRemaining == 0) {
        background(0);
        textSize(50);
        text("YOU WIN", 200, 200);
      }
      if (player1.x > 555)
      {
        player1.x = 555;
      } else if (player1.x < 0)
      {
        player1.x = 0;
      }
      if (player1.y > 340)
      {
        player1.y = 340;
      } else if (player1.y < 200)
      {
        player1.y = 200;
      }
    }
  }
}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      player1.y = player1.y - 12;
    } else if (keyCode == DOWN)
    {
      player1.y = player1.y + 12;
    } else if (keyCode == LEFT)
    {
      player1.x = player1.x - 12;
    } else if (keyCode == RIGHT)
    {
      player1.x = player1.x + 12;
    }
  }
  if (key == ' ')
    gameStatus = ON;
}
