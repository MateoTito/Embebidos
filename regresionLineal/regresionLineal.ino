  /*
 * UTN FICA CIERCOM
 * MATEO TITO
 * SISTEMAS EMBEBIDOS
 * 
 * Descripción: Programa que realiza una regresión lineal aplicando el
 *              método de los mínimos cuadrados (suma de los cuadrados
 *              de las diferencias ordenadas).
 *              Funciona con cualquier cantidad de observaciones, x e y
 *              deben tener siempre la misma cantidad de elementos.
 */

#include "datos.h" //Llamar la matriz al programa principal
int n = sizeof(x)/sizeof(x[0]); //Cantidad de elementos de x,y
float xmedia = 0; //Proemdio del vector x
float ymedia = 0; //Promedio del vector y
float D_xy = 0; //Desviación cruzada
float D_xx = 0; //Desviación de x
int i; //Contador
float b; //Punto de corte de la función
float m; //Pendiente de la función
void setup() {
  Serial.begin(9600); //Inicia Cx Serial
}

void loop() {
  for (i = 0; i < n; i++) { //Recorre todo el vector
    xmedia = xmedia + x[i]; //Suma todos los valores del vector x
    ymedia = ymedia + y[i]; //Suma todos los valores del vector y
    D_xy = D_xy + x[i] * y[i]; //Productos cruzados
    D_xx = D_xx + x[i] * x[i]; //Producto de x
  }

  xmedia = xmedia / n; //Promedio x
  ymedia = ymedia / n; //Promedio y

  D_xy = D_xy - n*xmedia*ymedia; //Mínimos cuadrados
  D_xx = D_xx - n*xmedia*xmedia;
   
  m = D_xy / D_xx; //Pendiente de la recta
  b = ymedia - m * xmedia; //Corte eje Y
  
  Serial.println("La regresión lineal simple da como ecuación: ");
  Serial.println("y(t) = "+String(b)+" + "+String(m)+"x");
  Serial.println("Fin programa");
  delay(50000); //Delay para que se ejecute una sola vez
}
