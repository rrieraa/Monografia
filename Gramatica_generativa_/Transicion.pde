class Transicion{
 //Atributos
 String transicion;
 float probabilidad;
 
 
 //Constructor
 Transicion(String t, float p){
   this.transicion = t;
   this.probabilidad = p;
 }
 
 String aplayRule(){
   return transicion;
 }
 
}
