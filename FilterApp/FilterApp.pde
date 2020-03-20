import java.lang.*;
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
//Detectores
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.objdetect.Objdetect;

CamController  camController;
Detection facesDetection;
Detection  smilesDection;
KeyController  keyController;
Filter filter;
int wordSize;

void setup(){
  size(640, 480, P3D);
  camController    = new CamController(new Capture(this,width,height));
  String faceFile  = "haarcascade_frontalface_default.xml";
  String smileFile = "haarcascade_smile.xml";
  wordSize = 15;
  facesDetection  = new FacesDetection(dataPath(faceFile));
  smilesDection   = new SmilesDetection(dataPath(smileFile));
  keyController   = new KeyController();
  filter          = new Filter();
  textAlign(CENTER,CENTER);
  textSize(wordSize);
}

void draw(){
  camController.takeImagen();
  camController.showImage();
  apllyFilter(camController.getImage());
}

void apllyFilter(CVImage img){
  Mat grey = img.getGrey();
  switch(keyController.getKeyPressed()) {
    case 0:
      filter.facesFilte(facesDetection.getObjectsDetection(grey));
      break;
    case 1:
      filter.smileFilter(smilesDection.getObjectsDetection(grey));
      break;
    case 2:
      CVImage result = new CVImage(width,height);
      cpMat2CVImage(img.getGrey(),result);
      image(result,0,0);
      text("Grey Shit",width*0.1,height*0.05);
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
