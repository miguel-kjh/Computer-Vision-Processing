class KeyController {
  
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[9];
  }
  
  public void updateKeysPressed(){
      if(key == 'q' || key == 'Q'){
        keyPosibles[0] = true; 
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[1] = true; 
      }
      if(key == 'e' || key == 'E'){
        keyPosibles[2] = true;
      }
  }
  
  public void updateKeysReleased(){
      if(key == 'q' || key == 'Q'){
        keyPosibles[0] = false; 
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[1] = false; 
      }
      if(key == 'e' || key == 'E'){
        keyPosibles[2] = false;
      }
  }
  
  public void moveScreen(){
    for(int i = 0; i < keyPosibles.length; i++){
          if(!keyPosibles[i]) continue;
          switch(i) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
            case 4:
              break;
            case 5:
              break;
            case 6:
              break;
            case 7:
              break;
            case 8:
              break;
            default:
              break;
          }
    }
  }
  
}
