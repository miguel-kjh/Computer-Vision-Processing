class Filter{
  public void smileFilter(Rect[] smiles){
    text("SimelDetected",width*0.1,height*0.05);
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
  
  public void facesFilte(Rect[] faces){
    text("FaceDetected",width*0.1,height*0.05);
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    for (Rect r : faces) {
      if(r.width < 100 && r.height < 100){
        continue;
      }
      rect(r.x, r.y, r.width, r.height);
     }
  }
}
