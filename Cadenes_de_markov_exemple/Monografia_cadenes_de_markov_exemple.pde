//Cadena de Markov de Les acompanyades -Els cavallets de Porreres-

String currentNote ="Do2";
String currentRithm="Negra";
int melodyLenght;

void setup(){
  melodyLenght = 50;
  for(int i= 0; i<melodyLenght; i++){
    if(i!=melodyLenght-1){
      print(currentNote + " " + currentRithm + "  ");
      currentNote = nextNote(currentNote);
      currentRithm= nextRithm(currentRithm);
    } else{
      print ("Do2 Negra");
    }
    
  }
}

String nextRithm(String currentRithm){
  float p = random(0,1);
  if(currentRithm == "Negra"){
    if(p<0.6){return "Corchea";}
    else{return "Semicorchea";}
  }else if(currentRithm == "Corchea_con_punto"){
    return "Semicorchea";
  }else if(currentRithm == "Corchea"){
    if(p<0.14){return "Negra";}
    else if(p>=0.14 && p<0.35){return "Corchea_con_punto";}
    else if(p>=0.35 && p<0.64){return "Corchea";}
    else{return "Semicorchea";}
  }else if(currentRithm == "Semicorchea_con_punto"){
    return "Fusa";
  }else if(currentRithm == "Semicorchea"){
    if(p<0.02){return "Negra";}
    else if(p>=0.02 && p<0.17){return "Corchea_con_punto";}
    else if(p>=0.17 && p<0.30){return "Corchea";}
    else if(p>=0.30 && p<0.37){return "Semicorchea_con_punto";}
    else{return "Semicorchea";}
  }else{
    if(p<0.2){return "Negra";}
    else if(p>=0.2 && p<0.4){return "Corchea_con_punto";}
    else {return "Semicorchea_con_punto";}
  }
}

String nextNote(String currentNote){
  float p = random(0,1);
  
  if(currentNote == "Si2"){
    if(p<0.5){return "Do2";}
    else{return "Do3";}
  }else if(currentNote == "Do2"){
    if(p<0.85){return "Re3";}
    else if(p>=0.85 && p<0.93){return "Si2";}
    else{return "Sol3";}
  }else if(currentNote == "Re3"){
    if(p<0.72){return "Mi3";}
    else{return "Do2";}
  }else if(currentNote == "Mi3"){
    if(p<0.38){return "Fa3";}
    else if(p>=0.38 && p<0.69){return "Re3";}
    else if(p>=0.69 && p<0.94){return "Do2";}
    else{return "La3";}
  }else if (currentNote == "Fa3"){
    if(p<0.55){return "Sol3";}
    else{return "Mi3";}
  }else if(currentNote == "Sol3"){
    if(p<0.5){return "La3";}
    else if(p>=0.5 && p<0.58){return "Sol3";}
    else{return "Fa3";}
  }else if(currentNote == "La3"){
    if(p<0.29){return "Do2";}
    else if(p>=0.29 && p<0.86){return "Sol3";}
    else{return "Do3";}
  }else if (currentNote == "Si3"){
    if(p<0.5){return "Do3";}
    else{return "La3";}
  }else{
    if(p<0.5){return "Si3";}
    else{return "Sol3";}
  }
}
