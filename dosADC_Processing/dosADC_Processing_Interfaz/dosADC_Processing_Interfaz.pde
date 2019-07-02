/*
  UTN FICA CIERCOM
 SISTEMAS EMBEBIDOS
 
 Mateo Tito
 01-07-2019
 
 Descripción:
 Se trata de una interfaz para Arduino, la cual cuenta
 con un botón de Conexión/Desconexión del puerto Serial
 y 2 "Contenedores" (Sliders) los cuales van cambiando
 su valor y color de acuerdo a 2 conversores análogo -
 digital conectados al Arduino.
 Arduino envía los datos del ADC 1 y 2 en forma de pseudo-
 trama, así: valorADC1|valorADC2, separado por una "|",
 la interfaz toma la trama identifica los valores y se
 los pasa al contenedor.
 */ 

// Librerías importadas.
import controlP5.*;
import processing.serial.*; //Conectar al puerto COM
// Objeto de la clase Serial.
Serial port;
// Objeto de la clase ControlP5.
ControlP5 cp5;
// Variables.
int con = 0;
String frame, adc1, adc2;
int iadc1, iadc2;
int index;

void setup() {
  // Tamaño de ventana.
  size(1200, 800);
  // Fondo blanco.
  background(255);
  // Margen.
  strokeWeight(15);
  stroke(15, 136, 159);
  line(25, 25, 1175, 25);
  line(1175, 25, 1175, 675);
  line(1175, 675, 25, 675);
  line(25, 675, 25, 25);
  // Nuevo objeto ControlP5.
  cp5 = new ControlP5(this);

  // Botón de Conexión/Desconexión.
  textSize(25);
  cp5.addButton("CONEXION")
    .setPosition(50, 50)
    .setSize(200, 100);

  // Contenedor 1.
  cp5.addSlider("ADC_1")
    .setPosition(400, 200)
    .setSize(50, 400)
    .setColorBackground(color(20, 34, 39))
    .setRange(0, 255)
    .setNumberOfTickMarks(255);

  // Contenedor 2.
  cp5.addSlider("ADC_2")
    .setPosition(800, 200)
    .setSize(50, 400)
    .setColorBackground(color(20, 34, 39))
    .setRange(0, 255)
    .setNumberOfTickMarks(255);
}

void draw() {
  // Fondo.
  background(255);
  // Margen.
  strokeWeight(15);
  stroke(15, 136, 159);
  line(25, 25, 1175, 25);
  line(1175, 25, 1175, 675);
  line(1175, 675, 25, 675);
  line(25, 675, 25, 25);
  // Etiquetas de los contenedores.
  textSize(30);
  fill(0, 102, 153);
  text("Contenedor \n    ADC1", 350, 125);
  text("Contenedor \n    ADC2", 750, 125);
  text("Valor: "+str(iadc1), 350, 650);
  text("Valor: "+str(iadc2), 750, 650);
  // Marcas de colores.
  textSize(20);
  fill(30, 230, 30);
  text("- Bueno", 475, 275);
  text("- Bueno", 875, 275);
  fill(254, 241, 0);
  text("- Regular", 475, 400);
  text("- Regular", 875, 400);
  fill(230, 30, 30);
  text("- Malo", 475, 525);
  text("- Malo", 875, 525);
  
  // Si la interfaz está conectada al puerto.
  if (con == 1) {
    // Si existen datos enviados por Arduino.
    if (port.available()>0) {
      // Guarda los datos en un String.
      frame = port.readString();
      // Toma errores de índice.
      try {
        // Almacena el índice de la pleca.
        index = frame.indexOf("|");
        // Validación.
        if (index <= 0)
          index = 1;
        // Almacena el primer valor en un String.
        adc1 = frame.substring(0, index);
        // Almacena el segundo valor en un String.
        adc2 = frame.substring(index+1, frame.length());
        // Los convierte a entero para el contenedor.
        iadc1 = int(adc1);
        iadc2 = int(adc2);
      } 
      // En caso de error setea los valores a default.
      catch (StringIndexOutOfBoundsException e) {
        iadc1 = 1;
        iadc2 = 1;
      }


      // Compara los valores obtenidos de acuerdo a un
      // rango y setea a los sliders con ese valor.
      
      // Contenedor para ADC 1.
      if (iadc1 <= 85) { // Rojo.
        cp5.getController("ADC_1")
          .setValue(iadc1); // Setea el valor.
        cp5.getController("ADC_1")
          .setColorForeground(color(230, 30, 30)); // Pinta.
      } else if (iadc1 > 85 && iadc1 <= 170) { // Amarillo.
        cp5.getController("ADC_1")
          .setValue(iadc1); // Setea el valor.
        cp5.getController("ADC_1") 
          .setColorForeground(color(254, 241, 0)); // Pinta.
      } else if (iadc1 > 170) { //Verde.
        cp5.getController("ADC_1")
          .setValue(iadc1); // Setea el valor.
        cp5.getController("ADC_1")
          .setColorForeground(color(30, 230, 30)); // Pinta.
      }

      // Contenedor para ADC 2.
      if (iadc2 <= 85) { // Rojo.
        println("rojo 2");
        cp5.getController("ADC_2")
          .setValue(iadc2); // Setea el valor.
        cp5.getController("ADC_2") 
          .setColorForeground(color(230, 30, 30)); // Pinta.
      } else if (iadc2 > 85 && iadc2 <= 170) { // Amarillo.
        println("amarillo 2");
        cp5.getController("ADC_2")
          .setValue(iadc2); // Setea el valor.
        cp5.getController("ADC_2")
          .setColorForeground(color(254, 241, 0)); // Pinta.
      } else if (iadc2 > 170) { //Verde.
        println("verde 2");
        cp5.getController("ADC_2")
          .setValue(iadc2); // Setea el valor.
        cp5.getController("ADC_2")
          .setColorForeground(color(30, 230, 30)); // Pinta.
      }
    }
  }
}

// Función del botón Conexión/Desconexión.
void CONEXION() {
  con = 1 - con;
  if (con == 1) { //Conectado.
    port = new Serial(this, "COM16", 9600);
    cp5.getController("CONEXION")
      .setLabel("CONECTADO");
    cp5.getController("CONEXION")
      .setColorBackground(color(30, 230, 30));
    println("COnectado");
  } else { // Desconectado.
    port.stop();
    cp5.getController("CONEXION")
      .setLabel("DESCONECTADO");
    cp5.getController("CONEXION")
      .setColorBackground(color(230, 30, 30));
    println("Desconectado");
  }
}
