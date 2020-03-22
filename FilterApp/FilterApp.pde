import java.lang.*;
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
import org.opencv.imgproc.Imgproc;

//Detectores
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.objdetect.Objdetect;
import gifAnimation.*;


CamController  camController;
Detection facesDetection;
Detection smilesDetection;
Detection handDetection;
Detection eyeDetection;
KeyController  keyController;
Filter filter;
int wordSize;
GifMaker gif;
final int maxFrame = 10;
int countFrame     = 0;

void setup(){
  size(640, 480, P3D);
  camController    = new CamController(new Capture(this,width,height));
  String faceFile  = "haarcascade_frontalface_alt2.xml";
  String eyesFile  = "haarcascade_eye_tree_eyeglasses.xml";
  String handFile  = "palm.xml";
  String smileFile = "haarcascade_smile.xml";
  wordSize = 15;
  facesDetection    = new FacesDetection(dataPath(faceFile));
  smilesDetection   = new SmilesDetection(dataPath(smileFile));
  handDetection     = new HandDetection(dataPath(handFile)); 
  eyeDetection      = new EyesDetection(dataPath(eyesFile));
  keyController     = new KeyController();
  filter            = new Filter();
  textAlign(CENTER,CENTER);
  textSize(wordSize);
  gif = new GifMaker(this,"animation.gif");
  gif.setRepeat(0);
}

void draw(){
  camController.takeImagen();
  camController.showImage();
  apllyFilter(camController.getImage());
  setFrame();
}

void setFrame(){
  if(countFrame == maxFrame){
      gif.addFrame();
      countFrame = 0;
  }
  countFrame++;
}

void apllyFilter(CVImage img){
  Mat grey = img.getGrey();
  switch(keyController.getKeyPressed()) {
    case 0:
      filter.facesFilter(facesDetection.getObjectsDetection(grey), img);
      break;
    case 1:
      filter.smileFilter(smilesDetection.getObjectsDetection(grey));
      break;
    case 2:
      /*CVImage result = new CVImage(width,height);
      cpMat2CVImage(img.getGrey(),result);
      image(result,0,0);
      text("Grey Shit",width*0.1,height*0.05);*/
      filter.handFilter(handDetection.getObjectsDetection(grey));
      break;
    case 3:
      filter.eyesFilter(eyeDetection.getObjectsDetection(grey), img);
      break;
  }
  /*CVImage result = new CVImage(width,height);
  cpMat2CVImage(img.getGrey(),result);*/
  //return img;
}

void cpMat2CVImage(Mat in_mat,CVImage out_img)
{    
  byte[] data8 = new byte[width*height];
  
  out_img.loadPixels();
  in_mat.get(0, 0, data8);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y * width;
      int val = data8[loc] & 0xFF;
      out_img.pixels[loc] = color(val);
    }
  }
  out_img.updatePixels();
}

void keyPressed(){
  keyController.updateKeysPressed();
}
