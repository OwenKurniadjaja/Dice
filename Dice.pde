void setup()
  {
    size(500,500);
      noLoop();
  }
  void draw()
  {
   background(0);
   int sum = 0;
   for(int y = 190; y < 400; y = y + 50){
    for(int x = 0;x < 500; x = x + 50)
    {
     Die sums = new Die(x,y);
     sums.roll();
     sums.show();
     sum = sum + sums.number;
    }
   }
   fill(250);
   text("Your Total is : "+sum,50,50);
   if(sum > 170){
     text("YOU WIN!!",50,65);
   }else{text("YOU LOSE!!",50,65);
   }
  }
  void mousePressed()
  {
      redraw();
  }
class Die //models one single dice cube
  {
      int myX, myY, number;
      int [] xPos = {25, 10, 40, 40, 10, 10, 40};
      int [] yPos = {25, 10, 40, 10, 40, 25, 25};
      boolean even;
      int total = 0;

      Die(int x, int y) //constructor
      {
          myX = x;
          myY = y;
      }
      void roll()
      {
          number = (int)(Math.random() * 6 + 1);
          if (number == 1||number == 3||number == 5) {
            even = false;
          } else if(number == 2||number==4||number==6){
            even = true;
          }
          total = total + number;
      }
      void show()
      {
        fill(255);
        rect(myX,myY, 50, 50);
        if (even == false) {
          for (int i = 0; i < number; i++) {
            fill(0);
            ellipse(myX + xPos[i], myY + yPos[i], 7, 7);
        }
      } else {
        for (int i = 1; i <= number; i++) {
            fill(0);
            ellipse(myX + xPos[i], myY + yPos[i], 7, 7);
        }
      }
    }
  }
