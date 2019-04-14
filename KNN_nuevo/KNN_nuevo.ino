/*
   UTN FICA CIERCOM
   Embebidos
   Mateo Tito

   Algoritmo del vecino más cercano con K flexible

   Descripción:
                El algoritmo aprende y clasifica de acuerdo
                a una matriz de datos y a un vector de datos
                de prueba (datos_entrada), mostrando por pantalla
                en el tipo. El valor de constante K se puede modifi-
                car de acuerdo al número de vecinos que se quiera.
   Datos: 
          En el archivo datos.h se almacena la matriz con los datos
          de aprendizaje, además al final de ese archivo se encuentran
          comentados valores para probar la efectividad del algoritmo.
                
*/

#include "datos.h" //Incluye la matriz de datos de aprendizaje
int fila = 0; //Para recorrer filas
int col; //Para recorrer columnas
float datos_entrada [4] = {5.4, 3.7, 1.5, 0.2}; //Datos para pruebas
float promedio = 0; //Almacena promedio de distancias
float distancia; //Almacena la raíz de la distancia
const int k = 3; //Número de vecinos
float dist_menores [2][k]; //Matriz de distancias y etiquetas
int i = 0; //Contador
int j = 0; //Contador
float aux; //Distancia
float aux1; //Etiqueta
int win; //Contador etiqueta que más se repite al final
int top; //Límite para determinar etiqueta (depende de K)
void setup() {
  Serial.begin(9600);
  for (; i < k; i++) { //Almacena valores de distancias altas
    dist_menores [0][i] = 4000 + i;
    dist_menores [1][i] = 0; //Valor de etiqueta cualquiera
  }
  i = 0; //Reset de variable para seguirla usando luego

}

void loop() {

  for (; fila < 90; fila++) { //Recorre todas las filas de la matriz
    for (col = 0; col < 4; col++) { //Recorre las 4 primeras columnas
      promedio = promedio + (pow(datos_entrada[col] - matriz[fila][col], 2)); //Potencia
    }
    distancia = sqrt(promedio); //Raíz de la distancia (fórmula)
    promedio = 0; //Reset

    //Compara la distancia y si es menor la almacena al final de la fila
    if (distancia < dist_menores [0][k - 1]) { //Inicio comparación
      dist_menores [0][k - 1] = distancia; //Almacena la distancia
      dist_menores [1][k - 1] = matriz[fila][4]; //Almacena la etiqueta
    } //Fin comparación

    //Ordena de menor a mayor las distancias
    for (i = 0; i < k; i++) { //Recorre filas
      for (j = i + 1; j < k; j++) { //Recorre columnas
        if (dist_menores [0][j] < dist_menores[0][i]) { //Compara de dos en dos
          aux = dist_menores[0][i]; //Ordena la fila de distancias
          dist_menores[0][i] = dist_menores[0][j];
          dist_menores[0][j] = aux;
          //Etiquetas
          aux1 = dist_menores[1][i]; //Ordena la fila de etiquetas
          dist_menores[1][i] = dist_menores[1][j];
          dist_menores[1][j] = aux1;
        }
      }
    } //Fin ordenar

  } //Fin recorrer filas de la matriz de datos

  top = round(k / 2); //Determina que etiqueta se repite más
  for (j = 0; j < k; j++) { //Toma cada etiqueta y la
    for (i = 0; i < k; i++) { //compara con las demás
      if (dist_menores [1][j] == dist_menores [1][i]) //si es igual
        win++;                //aumenta el contador
    }
    if (win >= top) { //Si cumple con el límite se termina la comparación
      Serial.println("CALCULO TERMINADO");
      Serial.print("ES DE TIPO -> ");
      Serial.println(int(dist_menores[1][j]));
      break;
    } else {
      win = 0; //Sino solo se resetea y se vuelve a buscar
    }
  }
  delay(50000); //Para que el programa se ejecute prácticamente 1 sola vez
} //Fin programa
