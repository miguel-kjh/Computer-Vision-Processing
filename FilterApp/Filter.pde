class Filter{
  
  private final Ball ball = new Ball(width/2,height/2,20,3,3);
  
  public void smileFilter(Rect[] smiles){
    text("Simel Detector",width*0.1,height*0.05);
    noFill();
    stroke(5,234,249);
    strokeWeight(4);
    if(smiles.length == 0){
      background(0);
      text("Smile",width*0.5,height*0.5);
      return;
    }
    for (Rect r : smiles) {
      rect(r.x, r.y, r.width, r.height);
    }
  }
  
  public void facesFilter(Rect[] faces, CVImage img){
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    if(faces.length > 0){
      for (Rect r : faces) {
      //rect(r.x, r.y, r.width, r.height);
        for(int x = 0; x < width; x++){
          for(int y = 0; y < height; y++){
              if(x > r.x && x < r.x + r.width && y > r.y && y < r.y + r.height){
                int loc         = x+y*width;
                int locRandom   = (int)random(0,width)+(int)random(0,height)*width;
                img.pixels[loc] = img.pixels[locRandom];
              }   
          }
        }
     }
     image(img,0,0);
    }
    noFill();
    stroke(255,255,255);
    text("Faces Detector",width*0.1,height*0.05);

  }
  
  private void paintBall(){
    ellipse(ball.getPosX(),ball.getPosY(),ball.getDimension(),ball.getDimension());
  }
  
  private void moveBall(){
    ball.moveX();
    ball.moveY();
    if (ball.getPosX() >= width || ball.getPosX() <= 0){
        ball.changeDirectionX();
    }
    if (ball.getPosY() >= height || ball.getPosY() <= 0){
        ball.changeDirectionY();
    }
  }
  
  public void handFilter(Rect[] faces){
    text("Hands Detector",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    paintBall();
    boolean isBallIntoArea = false;
    if(faces.length > 0){
      for (Rect r : faces) {
        if(ball.posX > r.x && ball.posX < r.x + r.width && ball.posY > r.y && ball.posY < r.y + r.height){
          isBallIntoArea = true;
        }
        rect(r.x, r.y, r.width, r.height);
      }
    }
    if(!isBallIntoArea)moveBall();
    noFill();
    stroke(255,255,255);
    text("Hands Detector",width*0.1,height*0.05);
  }
  
  private float midPoint(float x1,float x2){
    return (x1+x2)/2;
  }
  
  public void eyesFilter(Rect[] eyes, CVImage img){
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    CVImage auximg = new CVImage(width,height);
    if(eyes.length == 2){
      Mat grey = img.getGrey();
      Imgproc.threshold(grey,grey,255*midPoint(eyes[0].x,eyes[1].x)/width,
      255*midPoint(eyes[0].y,eyes[1].y)/height,Imgproc.THRESH_BINARY);
      cpMat2CVImage(grey,auximg);
      image(auximg,0,0);
    } 
    for (Rect r : eyes) {
      rect(r.x, r.y, r.width, r.height);
    }
    noFill();
    stroke(255,255,255);
    text("Eyes Detector",width*0.1,height*0.05);
  }
}

public class Ball {
    private float posX,posY;
    private int dimension;
    private float speedX,speedY;

    public Ball(float posX, float posY, int dimension, float speedX, float speedY) {
        this.posX = posX;
        this.posY = posY;
        this.dimension = dimension;
        this.speedX = speedX;
        this.speedY = speedY;
    }

    public void moveX(){
        posX += speedX;
    }

    public void moveY(){
        posY += speedY;
    }

    public void setPosX(float posX) {
        this.posX = posX;
    }

    public void setPosY(float posY) {
        this.posY = posY;
    }

    public float getPosX() {
        return posX;
    }

    public float getPosY() {
        return posY;
    }

    public int getDimension() {
        return dimension;
    }

    public float getSpeedX() {
        return speedX;
    }
    
    public float getSpeedY() {
        return speedY;
    }

    public void setSpeed(float speedX, float speedY) {
        this.speedX = speedX;
        this.speedY = speedY;
    }

    public void changeDirectionY() {
        speedY = -speedY;
    }

    public void changeDirectionX() {
        speedX = -speedX;
    }
}
