
void setup(){
  //Se inicializa en la nota tonal
  print("Do3_Negra ");
  //Succación de eventos de la que se crea la música
  A(); C();
  //Se finaliza en la nota tonal
  print("Do3_Redonda ");
}
//Acciones de los eventos:
  //Este es condicional peró no recursivo
  void A(){
    //Se da un valor aleatorio a 'p' para posteriormente selecicionar una opción al azar; todas las opciones tienen una probabilidad del 25%.
    float p = random(0,1);
    //Transiciones en funcion de que opción transcurra:
    if(p>0.00 && p<=0.25){
      C(); B(); print("Sol_Blanca ");
      
    }else if(p>0.25 && p<=0.50){
      B(); print("Sol_Negra "); C();
      
    }else if(p>0.50 && p<=0.75){
      D(); print("La_Corchera ");
      
    }else if(p>0.75 && p<=1.00){
      print("Re_CorcheraConPuntilla "); print("Mi_SemiCorchera ");
      
    }
  }
  //Este es no condicional peró ni es recursivo
  void B(){
    //Transición:
    print("Sol_Corchera "); print("Mi_SemiCorchera "); print("La_Corchera ");
  }
  //Este es condicional peró y recursivo
  void C(){
    //Se da un valor aleatorio a 'p' para posteriormente selecicionar una opción al azar; la primera opción tiene una probabilidad del 40% y las otras, del 20%.
    float p = random(0,1);
    //Transición:
    if(p>0.00 && p<=0.40){
      print("Re_Corchera "); C(); A();
      
    }else if(p>0.40 && p<=0.60){
      C(); print("Sol_Blanca ");
      
    }else if(p>0.60 && p<=0.80){
      C(); print("Mi_Corchera ");
      
    }else if(p>0.80 && p<=1.00){
      //Esta opción es la única que no es recursiva. Para que el algoritmo funcione, tiene que haber una.
      print("Fa corchera ");
      
    }
    
  }
  //Este es condicional peró no recursivo
  void D(){
    //Se da un valor aleatorio a 'p' para posteriormente selecicionar una opción al azar; todas las opciones tienen una probabilidad del 33%.
    float p = random(0,1);
    //Transición:
    if(p>0.00 && p<=0.33){
      B(); print("Sol_Negra ");
      
    }else if(p>0.33 && p<=0.66){
      print("Si_Blanca "); 
      
    }else if(p>0.66 && p<=1.00){
      print("Mi_Corchera "); C();
      
    }
  }
  
  //Este no es condicional ni recursivo
  void E(){
    //Transición:
    print("Mi3_chorechera "); C(); print("Mi3_Negra "); D();
  }