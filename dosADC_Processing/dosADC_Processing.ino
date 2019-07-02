/*
 * UTN FICA CIERCOM
 * SISTEMAS EMBEBIDOS
 * MATEO TITO
 * 01-07-2019
 * 
 * Descripción:
 * Programa que envía por comunicación Serial
 * el valor de dos conversores análogo - digital
 * para que una interfaz en Processing use dichos
 * datos. Se conectan dos potenciómetros a los 
 * pines 12 y 13 de Arduino.
 */

// Librería Timer.
#include <TimerOne.h>
// Variables.
String frame; // Trama.
int adc1, adc2; // Almacena valores.

void setup() {
  // Inicia Cx Serial.
  Serial.begin(9600);
  // Define pines como entradas(opcional).
  pinMode(12, INPUT);
  pinMode(11, INPUT);
  // Inicia el Timer cada 2 segundos.
  Timer1.initialize(2000000);
  Timer1.attachInterrupt(conteo);
}

void loop() {
}

// Evento Timer cada 2s.
void conteo() {
  // Lee ambos potenciómetros.
  adc1 = analogRead(11);
  adc2 = analogRead(12);
  // Crea una trama con las lecturas.
  frame = String(adc1) + "|" + String(adc2);
  // Envía la trama por Cx Serial a la interfaz.
  Serial.print(frame);
}
