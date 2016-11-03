//your variable declarations here
Asteroid rock[] = new Asteroid[25];
SpaceShip joe = new SpaceShip();
boolean gameOver = false;

public void setup() 
{
  size(800,800);
  for(int i = 0; i<rock.length; i++)
  {
    rock[i] = new Asteroid();
    rock[i].accelerate(1);
  }

  //your code here
}
public void draw()
{
  background(0);
  /*
  if(joe.getX() !=joe.getColor())
  {
    gameOver = true;
  }
  */
  if(gameOver ==false)
  {  
    joe.move();
    joe.show();
    for(int i = 0; i<rock.length ; i++)
    {
      rock[i].move();
      rock[i].show();
    }
  }
  else if (gameOver == true) 
  {
    textSize(100);
    textAlign(CENTER);
    text("Game Over", 400, 400);  
  }
//your code here
}

public void keyPressed()
{
  if(key == 'w')
  {
    joe.accelerate(.5); // increases speed of ship
  }
  if(key =='s')
  {
    joe.accelerate(-.5); //decreases speed of ship
  }
  if(key =='d')
  {
    joe.rotate(10);
  
  }
  if(key =='a')
  {
    joe.rotate(-10 );
    
  }
  if(key == 'h')
  {
    joe.setX((int)(Math.random()*800));
    joe.setY((int)(Math.random()*800));
    joe.setDirectionX(0);
    joe.setDirectionY(0);
  }
}
  public void keyReleased() 
  {
      joe.setDirectionX(.5 *Math.cos(joe.getPointDirection()*(Math.PI/180)));
      joe.setDirectionY(.5 *Math.sin(joe.getPointDirection()*(Math.PI/180)));

  }
class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    rotSpeed = (int)(Math.random()*9)-5;
    if(rotSpeed == 0)
    {
      rotSpeed ++;
    }
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 15;
    yCorners[0] = 0;
    xCorners[1] = 15;
    yCorners[1] = -6;
    xCorners[2] = 6;
    yCorners[2] = -12;
    xCorners[3] = -15;
    yCorners[3] = 0;
    xCorners[4] = -15;
    yCorners[4] = 8;
    xCorners[5] = 6;
    yCorners[5] = 9;

    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    myCenterX =(int)(Math.random()*800);
    myCenterY=(int)(Math.random()*800);
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection = (int)(Math.random()*800);
  }
  public void setX(int x)
    {
      myCenterX = x;
    }
  public void setY(int y)
  {
    myCenterY=y;
   //your code here
  }
  public int getX()
  {
    return (int)myCenterX;
  }
  public int getY()
  {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) 
  {
    myDirectionX = x; 
  }
  public void setDirectionY(double y) 
  {
    myDirectionY = y;  
  }
  public double getDirectionX() 
  {
    return myDirectionX;
  }
  public double getDirectionY()
  {
    return myDirectionY;
  }
  public void setPointDirection(int degrees)
  {
    myPointDirection = degrees; 
  }
  public double getPointDirection() 
  {
    return myPointDirection;
  }

  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 8;
    yCorners[0] = 0;
    xCorners[1] = -6;
    yCorners[1] = -10;
    xCorners[2] = -3;
    yCorners[2] = -4;
    xCorners[3] = -6;
    yCorners[3] = 0;
    xCorners[4] = -3;
    yCorners[4] = 4;
    xCorners[5] = -6;
    yCorners[5] = 10;
    myColor = color(255,255,255);
    myCenterX = 400;
    myCenterY=400;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection = 0;
    
  } 

  public void setX(int x)
  {
    myCenterX = x;
  }
  public void setY(int y)
  {
    myCenterY=y;
  }
  public int getX()
  {
    return (int)myCenterX;
  }
  public int getY()
  {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) 
  {
    myDirectionX = x; 
  }
  public void setDirectionY(double y) 
  {
    myDirectionY = y;  
  }
  public double getDirectionX() 
  {
    return myDirectionX;
  }
  public double getDirectionY()
  {
    return myDirectionY;
  }
  public void setPointDirection(int degrees)
  {
    myPointDirection = degrees; 
  }
  public double getPointDirection() 
  {
    return myPointDirection;
  }

  public int getColor()
  {
    return myColor;
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

