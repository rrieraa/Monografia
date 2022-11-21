int[][] casilla;

void setup(){
  casilla = new int[8][8];
  InicializarPrimeraFila();
}

void draw(){
  for(int i=0; i<casilla[0].length; i++){
    for(int j=0; i<casilla.length; i++){
      updateCasiila(i, j);
    }
  }
}

void InicializarPrimeraFila(){
  casilla[0][0] = 0;
  casilla[0][1] = 1;
  casilla[0][2] = 0;
  casilla[0][3] = 1;
  casilla[0][4] = 1;
  casilla[0][5] = 0;
  casilla[0][6] = 0;
  casilla[0][7] = 1;
}

void updateCasiila(int i, int j){
  if(i==0){
    //Primera Fila
    if        (casilla[7][j-1]== 1 && casilla[7][j]== 1 && casilla[7][j+1]==1){
        casilla[i][j]= 0;
      }else if(casilla[7][j-1]== 1 && casilla[7][j]== 1 && casilla[7][j+1]==0){
        casilla[i][j]= 1;
      }else if(casilla[7][j-1]== 1 && casilla[7][j]== 0 && casilla[7][j+1]==1){
        casilla[i][j]= 0;
      }else if(casilla[7][j-1]== 1 && casilla[7][j]== 0 && casilla[7][j+1]==0){
        casilla[i][j]= 1;
      }else if(casilla[7][j-1]== 0 && casilla[7][j]== 1 && casilla[7][j+1]==1){
        casilla[i][j]= 1;
      }else if(casilla[7][j-1]== 0 && casilla[7][j]== 1 && casilla[7][j+1]==0){
        casilla[i][j]= 0;
      }else if(casilla[7][j-1]== 0 && casilla[7][j]== 0 && casilla[7][j+1]==1){
        casilla[i][j]= 1;
      }else if(casilla[7][j-1]== 0 && casilla[7][j]== 0 && casilla[7][j+1]==0){
        casilla[i][j]= 0;
      }
  }else{
      if      (casilla[i-1][j-1]== 1 && casilla[i-1][j]== 1 && casilla[i-1][j+1]==1){
        casilla[i][j]= 0;
      }else if(casilla[i-1][j-1]== 1 && casilla[i-1][j]== 1 && casilla[i-1][j+1]==0){
        casilla[i][j]= 1;
      }else if(casilla[i-1][j-1]== 1 && casilla[i-1][j]== 0 && casilla[i-1][j+1]==1){
        casilla[i][j]= 0;
      }else if(casilla[i-1][j-1]== 1 && casilla[i-1][j]== 0 && casilla[i-1][j+1]==0){
        casilla[i][j]= 1;
      }else if(casilla[i-1][j-1]== 0 && casilla[i-1][j]== 1 && casilla[i-1][j+1]==1){
        casilla[i][j]= 1;
      }else if(casilla[i-1][j-1]== 0 && casilla[i-1][j]== 1 && casilla[i-1][j+1]==0){
        casilla[i][j]= 0;
      }else if(casilla[i-1][j-1]== 0 && casilla[i-1][j]== 0 && casilla[i-1][j+1]==1){
        casilla[i][j]= 1;
      }else if(casilla[i-1][j-1]== 0 && casilla[i-1][j]== 0 && casilla[i-1][j+1]==0){
        casilla[i][j]= 0;
      }
    }
    
    /*POSSIBLE SOLUCIÓ????:
      if      (casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==1){
        casilla[i][j]= 0;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==0){
        casilla[i][j]= 1;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==1){
        casilla[i][j]= 0;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==0){
        casilla[i][j]= 1;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==1){
        casilla[i][j]= 1;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 1 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==0){
        casilla[i][j]= 0;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==1){
        casilla[i][j]= 1;
      }else if(casilla[(i-1)%casilla.length][(j-1)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j)%casilla[i-1].length]== 0 && casilla[(i-1)%casilla.length][(j+1)%casilla[i-1].length]==0){
        casilla[i][j]= 0;
      }
      */
      
  }
