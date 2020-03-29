PImage bgImg, groundhogImg, lifeImg, robotImg, soilImg, soldierImg;

int lifeX=10, lifeY=10, lifeW=50, lifeH=51;

int soilBlock=80;

int soldierRandomY = floor(random(4));
int soldierX=0;

int robotRandomY = floor(random(4)); //0,1,2,3,4
int robotRandomX = floor(random(2, 8)); //2,3,4,5,6,7
int laserLeftX = soilBlock*robotRandomX+25, laserRightX = soilBlock*robotRandomX+25;
int laserLeftY = 160+robotRandomY*soilBlock+37, laserRightY =160+robotRandomY*soilBlock+37;

float lifeD=20;


void setup() {
  size(640, 480, P2D);
  // Enter Your Setup Code Here
  bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
}

void draw() {
  // Enter Your Code Here

  //backround
  image(bgImg, 0, 0);

  //soil
  image(soilImg, 0, 160);

  //life
  image(lifeImg, lifeX, lifeY);
  image(lifeImg, lifeX+lifeW+lifeD, lifeY);
  image(lifeImg, lifeX+2*lifeW+2*lifeD, lifeY);

  //sun
  colorMode(RGB);
  fill(253, 184, 19); //light yellow
  stroke(255, 255, 0); //yellow
  strokeWeight(5);
  ellipse(width-50, 50, 120, 120);

  //grass
  colorMode(RGB);
  noStroke();
  fill(124, 204, 25);//green
  rectMode(CORNERS);
  rect(0, 145, 640, 160);

  //soldier
  image(soldierImg, soldierX, 160+soldierRandomY*soilBlock);
  soldierX = soldierX+1;
  if (soldierX >= width) {
    soldierX=-soldierImg.width;
  }

  //robot
  image(robotImg, soilBlock*robotRandomX, 160+robotRandomY*soilBlock);

  //laser

  stroke(255, 0, 0); //red
  strokeWeight(10);
  line(laserLeftX, laserLeftY, laserRightX, laserRightY);
  laserLeftX = laserLeftX-2;
  if (laserRightX-laserLeftX >= 30) {
    laserRightX=laserRightX-2;
  }
  if (soilBlock*robotRandomX+25-laserLeftX>185) {
    laserLeftX=soilBlock*robotRandomX+25;
    laserRightX=soilBlock*robotRandomX+25;
  }
}
