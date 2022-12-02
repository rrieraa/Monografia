void setup(){
  //Se inicializa en la nota tonal
  print("Do3_Negra ");
  //Sucesión de eventos de la que se crea la música
  A(); C();
  //Se finaliza en la nota tonal quue durará lo que falte para la finalización del compás
  print("Do3 ");
}
//Acciones de los eventos:
  //Este es condicional y llama a otras funciones peró no recursivo
  void A(){
    //Se da un valor aleatorio a 'p' para posteriormente selecicionar una opción al azar; todas las opciones tienen una probabilidad del 25%.
    float p = random(0,1);
    //Transiciones en función de que opción transcurra:
    if(p>0.00 && p<=0.25){
      C(); B(); print("Sol3_Blanca ");
    }else if(p>0.25 && p<=0.50){
      B(); print("Sol3_Negra "); C();
    }else if(p>0.50 && p<=0.75){
      D(); print("La3_Corchera ");
    }else if(p>0.75 && p<=1.00){
      print("Re3_CorcheraConPuntilla "); print("Mi3_SemiCorchera ");
    }
  }
  //Este no es condicional ni llama a otras funciones ni es recursivo
  void B(){
    //Transición:
    print("Sol3_Corchera "); print("Mi3_Negra "); print("La3_Corchera ");
  }
  //Este es condicional, llama a otras funciones  y recursivo
  void C(){
    //Se da un valor aleatorio a 'p' para posteriormente seleccionar una opción al azar; la primera opción tiene una probabilidad del 40% y las otras, del 20%.
    float p = random(0,1);
    //Transición:
    if(p>0.00 && p<=0.40){
      print("Re3_Corchera "); C(); A();      
    }else if(p>0.40 && p<=0.60){
      C(); print("Sol3_Blanca ");
    }else if(p>0.60 && p<=0.80){
      C(); print("Mi3_Corchera ");
    }else if(p>0.80 && p<=1.00){
      //Esta opción es la única que no es recursiva. Para que el algoritmo funcione, tiene que haber una.
      print("Fa3_Corchera ");
    }
  }
  //Este no es condicional ni llama a otras funciones ni es recursivo
  void D(){
    print("Re3_SemiCorchera "); print("Mi3_SemiCorchera "); print("Fa3_SemiCorchera "); print("Sol3_SemiCorchera ");
  }
  
  //Este no es condicional ni recursivo pero llama a otras funciones 
  void E(){
    //Transición:
    print("Mi3_chorechera "); C(); print("Mi3_Negra "); D();
  }
