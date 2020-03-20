interface Detection{
  Rect[] getObjectsDetection(Mat grey);
}

class FacesDetection implements Detection{
 private CascadeClassifier faceDetected;
 private ArrayList<PVector> points;
  
  
  public FacesDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
    points       = new ArrayList<PVector>();
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect faces = new MatOfRect();
    faceDetected.detectMultiScale(grey, faces, 1.0485258, 6, 
    Objdetect.CASCADE_SCALE_IMAGE, 
    new Size(60, 60), new Size(200, 200));
    return faces.toArray();
    
  }
  
  /*private void paint(Rect[] facesArr){
    text("FaceDetected",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    for (Rect r : facesArr) {
      if(r.width < 150 && r.height < 150){
        continue;
      }
      rect(r.x, r.y, r.width, r.height);
      points.add(calculateMidPoint(r.x, r.y, r.x+r.width, r.y+r.height));
     }
     //drawLine();
  }
  
  public void drawLine(){
    int dimX = 5;
    int dimY = 5;
    for(int index = 0; index < points.size() - 1; index++){
        PVector firstPoint = points.get(index);
        PVector secondPoint = points.get(index+1);
        ellipse(firstPoint.x,firstPoint.y,dimX,dimY);
        ellipse(secondPoint.x,secondPoint.y,dimX,dimX);
        line(firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y);
    }
  }
  
  private PVector calculateMidPoint(float x0,float y0,float x1, float y1){
    return new PVector((x0+x1)/2,(y0+y1)/2);
  }
  
  public void removePaints(){
    points.clear();
  }*/
}

class SmilesDetection implements Detection{
   private CascadeClassifier faceDetected;
  
  
  public SmilesDetection(String modelPath){
    faceDetected = new CascadeClassifier(modelPath);
  }
  
  
  public Rect[] getObjectsDetection(Mat grey){
    MatOfRect bodies = new MatOfRect();
    faceDetected.detectMultiScale(grey, bodies, 1.8, 20);
    return bodies.toArray();
    
  }
  
  /*private void paint(Rect[] bodiesArr){
    text("SimelDetected",width*0.1,height*0.05);
    noFill();
    stroke(5,234,249);
    strokeWeight(4);
    if(bodiesArr.length == 0){
      text("Smile",width*0.5,height*0.5);
      return;
    }
    for (Rect r : bodiesArr) {
      rect(r.x, r.y, r.width, r.height);
    }
  }*/
}
