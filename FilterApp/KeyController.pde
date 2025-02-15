class KeyController {
  
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[4];
  }
  
  public void updateKeysPressed(){
      if(key == 'q' || key == 'Q'){
        keyPosibles[0] = true;
        keyPosibles[1] = false; 
        keyPosibles[2] = false;
        keyPosibles[3] = false;
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[0] = false;
        keyPosibles[1] = true; 
        keyPosibles[2] = false;
        keyPosibles[3] = false;
      }
      if(key == 'e' || key == 'E'){
        keyPosibles[0] = false;
        keyPosibles[1] = false; 
        keyPosibles[2] = true;
        keyPosibles[3] = false;
      }
      if(key == 'r' || key == 'R'){
        keyPosibles[0] = false;
        keyPosibles[1] = false; 
        keyPosibles[2] = false;
        keyPosibles[3] = true;
      }
  }
  
  public int getKeyPressed(){
    for(int i = 0; i < keyPosibles.length; i++){
      if(keyPosibles[i]) return i;
    }
    return -1;
  }
  
}
