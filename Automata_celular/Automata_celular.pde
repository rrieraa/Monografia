int[] rule = {1,0,0,0,0,0,0,0};  // Cellular Automata Rule (rule ___)
int[] firstRow = {0, 0, 0, 1, 0, 0, 0};
int[] currentGeneration;
int[] nextGeneration;

float cellWidth;  // Width of the Cells
float cellHeight;  // Height of the Cells

int numCasillas = 7;

void setup(){
  size(800,800);
  //Inicia los Arrays con el número de casillas
  currentGeneration = new int[numCasillas]; currentGeneration = firstRow;
  nextGeneration = new int[numCasillas];
  // Calculates the width and height of the cells depending on the number of Items in a Generation
  cellWidth = width / (float) numCasillas;
  cellHeight = cellWidth;
}

void draw(){
  
  if(frameCount%40 ==0){
    //DEmanar pq no fufa si es menor estricte
  background(255);
  for(int y=0; y<height-50; y+=cellHeight){
    for(int x=0; x<width-50; x+=cellWidth){
      displayRow(currentGeneration, x, y);
    }
    calculateNextGeneration();
    currentGeneration = nextGeneration;
  }
  }
  
}

void displayRow(int[] generation,int x, int y){
  //Calcula si es blanco o negro
  int valueCasilla = generation[x/((int)cellWidth)];
  if(valueCasilla==0){
    fill(255);
  }else if(valueCasilla==1){
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
 
  c= currentGeneration[n];
 
  if(n==0){
    l = currentGeneration[numCasillas-1];
  }else{
    l = currentGeneration[n-1];
  }
   
  if(n==numCasillas-1){
    r = currentGeneration[0];
  }else{
    r = currentGeneration[n+1];
  }
  
   println(l +" , "+ c +" , " +r);
  int Value = 4*l +c*2 +r;
  return rule[Value];
}
