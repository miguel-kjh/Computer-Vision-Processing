class CamController{
  private Capture cam;
  private CVImage img;
  
  public CamController(Capture cam){
     this.cam = cam;
     this.cam.start();
     System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
     println(Core.VERSION);
     this.img = new CVImage(cam.width, cam.height);
  }
  
  public void takeImagen(){
    if (this.cam.available()) {
        background(0);
        cam.read();
        img.copy(cam, 0, 0, cam.width, cam.height, 
          0, 0, img.width, img.height);
          img.copyTo();
        image(img,0,0);
    }
  }

}
