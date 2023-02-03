String[] Eventos = {"A", "B", "C", "D", "E"};
Rule[] rules = new Rule[5];
Transicion[] TransicionesA = new Transicion[4];
Transicion[] TransicionesB = new Transicion[1];
Transicion[] TransicionesC = new Transicion[4];
Transicion[] TransicionesD = new Transicion[1];
Transicion[] TransicionesE = new Transicion[1];
String Melody = "AC";
String output = "";
int Iteration =0;

void setup() {
  
  setRules();

  while (!isMelodyEnded(Melody, Eventos)) {
    output = "";
    for (int c=0; c<Melody.length(); c++) {
      char s = Melody.charAt(c);
      boolean ruleApplied = false;
      for (Rule r : rules) {
        if (r.nombre==s) {
          ruleApplied = true;
          output += r.transicionar();
        }
      }
      if(!ruleApplied){
        output += s;
      }
    }
    Melody = output;
  }
    println("Melody:\n" + "do3_negra " + output+ "do3");
}

boolean isMelodyEnded(String M, String[] Events) {
  for (int i=0; i<Events.length; i++) {
    String event = Events[i];
    if (M.indexOf(event)!=-1) {
      return false;
    }
  }
  return true;
}

void setRules() {
  setTrnsiciones();
  rules[0] = new Rule('A', TransicionesA);
  rules[1] = new Rule('B', TransicionesB);
  rules[2] = new Rule('C', TransicionesC);
  rules[3] = new Rule('D', TransicionesD);
  rules[4] = new Rule('E', TransicionesE);
}

void setTrnsiciones() {

  //Transiciones de A: Es condicional y llama a otros eventos peró no recursivo
  TransicionesA[0] = new Transicion("C B sol3_blanca ", 0.25);
  TransicionesA[1] = new Transicion("B sol3_negra C ", 0.25);
  TransicionesA[2] = new Transicion("D la3_corchera ", 0.25);
  TransicionesA[3] = new Transicion("re3_corcheraconpuntillo mi3_semicorchera ", 0.25);

  //Transiciones de B: No es condicional ni llama a otros eventos ni es recursivo
  TransicionesB[0] = new Transicion("sol3_corchera mi3_negra la3_corchera ", 1);

  //Transiciones de C: Es condicional, llama a otros eventoss  y recursivo
  TransicionesC[0] = new Transicion("re3_corchera C A ", 0.40);
  TransicionesC[1] = new Transicion("C sol3_blanca ", 0.20);
  TransicionesC[2] = new Transicion("C mi3_corchera ", 0.20);
  //Esta opción es la única que no es recursiva. Para que el algoritmo funcione, tiene que haber una.
  TransicionesC[3] = new Transicion("fa3_corcera ", 0.20);

  //Transiciones de D: No es condicional ni llama a otros eventos ni es recursivo
  TransicionesD[0] = new Transicion("re3_semicorchera mi3_semicorchera fa3_semicorchera sol3_semicorchera ", 1);

  //Transiciones de E: No es condicional ni recursivo pero llama a otros eventos
  TransicionesE[0] = new Transicion("mi3_corchera C mi3_negra D ", 1);
}
