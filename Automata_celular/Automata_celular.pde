int[] rule = {0,0,1,1,1,1,0,0};  // Cellular Automata Rule (rule ___)
int[] firstRow = {0, 0, 0, 1, 0, 0, 0};
int[] currentGeneration;
int[] nextGeneration;
int[] lastGeneration;

float cellWidth;  // Width of the Cells
float cellHeight;  // Height of the Cells

int numCasillas = 7;
int numGeneration;

void setup(){
  size(800,800);
  frameRate(20);
  background(255);
  //Inicia los Arrays con el número de casillas
  currentGeneration = new int[numCasillas]; currentGeneration = firstRow;
  nextGeneration = new int[numCasillas];
  lastGeneration = new int[numCasillas];
  // Calculates the width and height of the cells depending on the number of Items in a Generation
  cellWidth = width / (float) numCasillas;
  cellHeight = cellWidth;
}

void draw(){
  
  if(frameCount<2){
    //Se inicializa en la nota tonal
  print("Do3_Negra ");
  }
  else if(frameCount <150 && frameCount>2){
    //Dibuja la línea correspondiente
    displayRow(numGeneration);
    
    //Calcula los valores de la próxima generación
    calculateNextGeneration();
    
    //Asigna los valores calculados a la generación actual
    swapArrays(currentGeneration, nextGeneration);
    
    
    if(numGeneration < numCasillas){
      numGeneration++;
    }else{
      //Se vuelve al prinicpio
      numGeneration = 0;
      //Last generation prende los valores de current generation
      swapArrays(lastGeneration, currentGeneration);
      //Se analizala última fila para saber que notas se van a tocar
      analizeLastRow();
      
    }
  }else if (frameCount>150 && frameCount<152){
    //Se finaliza con la tónica hasta que se acabe el compás
    print("Do3 ");
  }
}

void analizeLastRow(){
  for(int i=0; i<numCasillas; i++){
    if(checkLife(i)){
      printNote(i);
      //Se adjudica un Ritmo aleatorio
      randomRythm();
    }
  }
}

void randomRythm(){
  //Se da un valor aleatorio a 'p' para posteriormente selecicionar una opción al azar; todas las opciones tienen una probabilidad del 33%.
  float p = random(0, 1);
  
  if(p<0.33){
    print("_Negra ");
  }else if(p>=0.33 && p<=0.50){
    print("_Corchea ");
  }else if(p>0.66 && p<=1.00){
    print("_SemiCorchea ");
  }
  
}

void printNote(int i){
  if(i==0){
    print("Do3");
  }else if(i==1){
    print("Re3");
  }else if(i==2){
    print("Mi3");
  }else if(i==3){
    print("Fa3");
  }else if(i==4){
    print("Sol3");
  }else if(i==5){
    print("La3");
  }else if(i==6){
    print("Si3");
  }
}

boolean checkLife(int i){
  if(lastGeneration[i]==0){
    return false;
  }else{
    return true;
  }
  
}

void swapArrays(int[]a, int[]b){
  for(int i =0; i<a.length ; i++){
    a[i]=b[i];
  }
}

void displayRow(int numRow){
  for(int i=0; i<numCasillas; i++){
    //Calculo de la posición de la casilla
    float x = i*cellWidth;
    float y = numRow*cellHeight;
    //Calculo del valor de la casilla
    int value = currentGeneration[i];
    
    displayCasilla(value, x, y);
  }
}

void displayCasilla(int value, float x, float y){
  //Pinta la casilla de negro '1' o la pinta de blanco '0'
  if(value==0){
    fill(255);
  }else if(value==1){
    fill(0);
  }
  //Dibuja la casilla
  rect(x, y, cellWidth, cellHeight);
}

void calculateNextGeneration(){
  for(int i=0; i<numCasillas; i++){
    nextGeneration[i] = calculateCasilla(i);
  }
}

int calculateCasilla(int n){
  int l, c, r;
  //Casilla Central
  c= currentGeneration[n];
  //Casilla de la izquierda
  if(n==0){
    l = currentGeneration[numCasillas-1];
  }else{
    l = currentGeneration[n-1];
  }
  //Casilla de la derecha
  if(n==numCasillas-1){
    r = currentGeneration[0];
  }else{
    r = currentGeneration[n+1];
  }
  //Cálculo del valor
  int Value = 4*l +c*2 +r;
  return rule[Value];
}
