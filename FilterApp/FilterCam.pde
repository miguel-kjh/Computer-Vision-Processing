interface Detection{
  Rect[] getObjectsDetection(Mat grey);
}

class FacesDetection implements Detection{
 private CascadeClassifier faceDetected;
  
  
  public FacesDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect faces = new MatOfRect();
    faceDetected.detectMultiScale(grey, faces, 1.0485258, 6, 
    Objdetect.CASCADE_SCALE_IMAGE, 
    new Size(60, 60), new Size(200, 200));
    return faces.toArray();
    
  }
}

class SmilesDetection implements Detection{
   private CascadeClassifier faceDetected;
  
  
  public SmilesDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect smiles = new MatOfRect();
    faceDetected.detectMultiScale(grey, smiles, 1.8, 20);
    return smiles.toArray();
    
  }
}

class HandDetection implements Detection{
   private CascadeClassifier faceDetected;
  
  
  public HandDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect eyes = new MatOfRect();
    faceDetected.detectMultiScale(grey, eyes,  1.0485258, 6, 
    Objdetect.CASCADE_SCALE_IMAGE, 
    new Size(60, 60), new Size(200, 200));
    return eyes.toArray();
    
  }
}

class EyesDetection implements Detection{
   private CascadeClassifier faceDetected;
  
  
  public EyesDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect eyes = new MatOfRect();
    faceDetected.detectMultiScale(grey, eyes, 1.0485258, 6, 
    Objdetect.CASCADE_SCALE_IMAGE, 
    new Size(60, 60), new Size(200, 200));
    return eyes.toArray();
    
  }
}
