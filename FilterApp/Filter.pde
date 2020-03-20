class Filter{
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
  
  public void facesFilter(Rect[] faces){
    text("Faces Detector",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    for (Rect r : faces) {
      rect(r.x, r.y, r.width, r.height);
     }
  }
  
  public void handFilter(Rect[] faces){
    text("Hands Detector",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    circle(0,0,10);
    for (Rect r : faces) {
      rect(r.x, r.y, r.width, r.height);
     }
  }
  
  public void eyesFilter(Rect[] faces){
    text("Eyes Detector",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    for (Rect r : faces) {
      rect(r.x, r.y, r.width, r.height);
     }
  }
}
