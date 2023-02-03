class Rule {
  //Atributos
  char nombre;
  Transicion[] transicion;

  //Constructor
  Rule(char n, Transicion ... t) {
    this.nombre = n;
    this.transicion = t;
  }

  String transicionar(){
    float p = 0;
    float r = random(0, 1);
    for (int i = 0; i<this.transicion.length; i++) {
      p+= transicion[i].probabilidad;
      if (r<p) {
        return transicion[i].aplayRule();
      }
    }
    return "ERROR";
  }
}
