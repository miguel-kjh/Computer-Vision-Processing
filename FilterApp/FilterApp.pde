import java.lang.*;
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
//Detectores
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.objdetect.Objdetect;

CamController camController;

void setup(){
  size(640, 480, P3D);
  camController = new CamController(new Capture(this,width,height));
}

void draw(){
  camController.takeImagen();
  
}
