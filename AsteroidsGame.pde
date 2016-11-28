//your variable declarations here
ArrayList <Asteroid> rock = new ArrayList <Asteroid>();
Star[] space = new Star[100];
SpaceShip joe = new SpaceShip();
ArrayList <Bullet> b = new ArrayList <Bullet>();
public boolean gameOver = false;

public void setup() 
{
  size(800,800);
  for(int i = 0; i<25; i++)
  {
    rock.add(i, new Asteroid());
  }
  for(int j = 0;j<space.length;j++)
  {
    space[j] = new Star();
  }
  //System.out.println(rock);
  //your code here
}
public void draw()
{
  background(0);
  for(int j = 0;j<space.length;j++)
  {
    //space[j] = new Star();
    space[j].show();

  }
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
    for(int i = 0; i<rock.size() ; i++)
    {
      rock.get(i).move();
      rock.get(i).show();
      if(dist(joe.getX(), joe.getY(), rock.get(i).getX(), rock.get(i).getY())<20)
      {
      rock.remove(i);
      rock.add(i, new Asteroid());
      }
    }
    for (int i = 0; i<b.size();i++)
    {
      b.get(i).move();
      b.get(i).show();
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
    joe.rotate(5);
  
  }
  if(key =='a')
  {
    joe.rotate(-5 );
    
  }
  if(key == 104) //'h'
  {
    joe.setX((int)(Math.random()*800));
    joe.setY((int)(Math.random()*800));
    joe.setDirectionX(0);
    joe.setDirectionY(0);
  }

  if(key == 32) //spacebar
  {
    b.add(new Bullet(joe));
  }

}
  public void keyReleased() 
  {
    if(key == 'w'||key == 's')
    {
      joe.setDirectionX(.5 *Math.cos(joe.getPointDirection()*(Math.PI/180)));
      joe.setDirectionY(.5 *Math.sin(joe.getPointDirection()*(Math.PI/180)));
    }
  }
class Bullet extends Floater
{
  private double dRadians = myPointDirection*(Math.PI/180);
  public Bullet (SpaceShip theShip)
  {
    myColor = color(255,255,102);
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    myDirectionX = (5*Math.cos(dRadians))+theShip.getDirectionX();
    myDirectionY = (5*Math.sin(dRadians))+theShip.getDirectionY();
  }
  public void show()
  {
    stroke(myColor,50);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
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
    myDirectionX=(Math.random()*2)-1;
    myDirectionY=(Math.random()*2)-1;
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
class Star
{
  private int x,y;
  public Star()
    {
      x = (int)(Math.random()*800);
      y = (int)(Math.random()*800);
    }
  public void show()
    {
      stroke (255);
      strokeWeight(2);
      point (x,y);
    }
}   

