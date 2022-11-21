import wellen.*; 
//regla 31
int separacio=3;
int[] cell = new int[separacio];
int[] temp = new int[separacio];
int costat;
int y = 0;
//notes GM
int[] notesEscala = {55, 57, 59, 60, 62, 64, 66, 67};
void setup() {
  size(800, 800);
  rectMode(CENTER);
  costat = width/separacio;
  y = costat/2;
  background(255);
  for (int i =0; i<cell.length; i++) {
    cell[i] = (int)random(0, 2);
  }
  //cell[] = [0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0];
}
void draw() {

  if (frameCount%30==0) {
    createLine();
  }
  tocarNotes();
}

void createLine() {
  for (int i = 0; i<cell.length; i++) {
    if (cell[i]==1)
    {
      stroke(0); strokeWeight(1);
      fill(0);
    } else {
      stroke(255); strokeWeight(1);
      fill(255);
    }
    rect(i*costat + (costat/2), y, costat, costat);
  }
  novaLinea();

  y +=costat;
  if(y>height){
    y = costat/2;
  }
}
void novaLinea() {
  for (int i = 0; i<cell.length; i++) {
    if (i==0) {
      if (cell[i]==0&&cell[i+1]==0&&cell[separacio-1]==0) {
        temp[i]= 0;
      } else if (cell[i]==0&&cell[i+1]==0&&cell[separacio-1]==1) {
        temp[i]= 1;
      } else if (cell[i]==0&&cell[i+1]==1&&cell[separacio-1]==0) {
        temp[i]= 0;
      } else if (cell[i]==0&&cell[i+1]==1&&cell[separacio-1]==1) {
        temp[i]= 1;
      } else if (cell[i]==1&&cell[i+1]==0&&cell[separacio-1]==0) {
        temp[i]= 1;
      } else if (cell[i]==1&&cell[i+1]==0&&cell[separacio-1]==1) {
        temp[i]= 0;
      } else if (cell[i]==1&&cell[i+1]==1&&cell[separacio-1]==0) {
        temp[i]= 1;
      } else if (cell[i]==1&&cell[i+1]==1&&cell[separacio-1]==1) {
        temp[i]= 0;
      }
    } else {
      if (cell[i%cell.length]==0&&cell[(i+1)%cell.length]==0&&cell[(i-1)%cell.length]==0) {
        temp[i]= 0;
      } else if (cell[i%cell.length]==0&&cell[(i+1)%cell.length]==0&&cell[(i-1)%cell.length]==1) {
        temp[i]= 1;
      } else if (cell[i%cell.length]==0&&cell[(i+1)%cell.length]==1&&cell[(i-1)%cell.length]==0) {
        temp[i]= 0;
      } else if (cell[i%cell.length]==0&&cell[(i+1)%cell.length]==1&&cell[(i-1)%cell.length]==1) {
        temp[i]= 1;
      } else if (cell[i%cell.length]==1&&cell[(i+1)%cell.length]==0&&cell[(i-1)%cell.length]==0) {
        temp[i]= 1;
      } else if (cell[i%cell.length]==1&&cell[(i+1)%cell.length]==0&&cell[(i-1)%cell.length]==1) {
        temp[i]= 0;
      } else if (cell[i%cell.length]==1&&cell[(i+1)%cell.length]==1&&cell[(i-1)%cell.length]==0) {
        temp[i]= 1;
      } else if (cell[i%cell.length]==1&&cell[(i+1)%cell.length]==1&&cell[(i-1)%cell.length]==1) {
        temp[i]= 0;
      }
    }
    //copiar arrays
    cell[i]=temp[i];
  }
}

void tocarNotes() {
  if(comparaArray(cell, 0, 0, 0)){
    Tone.note_on(notesEscala[0], 100);
  }else if(comparaArray(cell, 0, 0, 1)){
    Tone.note_on(notesEscala[1], 100);
  }else if(comparaArray(cell, 0, 1, 0)){
    Tone.note_on(notesEscala[2], 100);
  }else if(comparaArray(cell, 0, 1, 1)){
    Tone.note_on(notesEscala[3], 100);
  }else if(comparaArray(cell, 1, 0, 0)){
    Tone.note_on(notesEscala[4], 100);
  }else if(comparaArray(cell, 1, 0, 1)){
    Tone.note_on(notesEscala[5], 100);
  }else if(comparaArray(cell, 1, 1, 0)){
    Tone.note_on(notesEscala[6], 100);
  }else if(comparaArray(cell, 1, 1, 1)){
    Tone.note_on(notesEscala[7], 100);
  }
}

boolean comparaArray(int[] array, int ... valors){
  boolean b = true;
  for(int i=0; i<valors.length; i++){
    if(array[i]!=valors[i]){
      return false;
    }
  }
  return b;
}
