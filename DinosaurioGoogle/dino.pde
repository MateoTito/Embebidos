/*
  UTN FICA CIERCOM
  SISTEMAS EMBEBIDOS
  MATEO TITO
  
  Descripción:
  Programa que genera en base a muchos puntos
  el dinosaurio de Google.
*/

void setup() {
  // Fondo color blanco.
  background(255);
  // Tamaño de ventana.
  size(500,500);
}

void draw(){
  fill(0); // Color negro.
  // Figura -> Dinosaurio.
  beginShape();
  vertex(50,200);
  vertex(50,300);
  vertex(70,300);
  vertex(70,320);
  vertex(90,320);
  vertex(90,340);
  vertex(110,340);
  vertex(110,360);
  vertex(130,360);
  vertex(130,380);
  vertex(150,380);
  vertex(150,470);
  vertex(200,470);
  vertex(200,450);
  vertex(180,450);
  vertex(180,430);
  vertex(200,430);
  vertex(200,410);
  vertex(220,410);
  vertex(220,390);
  vertex(240,390);
  vertex(240,410);
  vertex(260,410);
  vertex(260,470);
  vertex(310,470);
  vertex(310,450);
  vertex(290,450);
  vertex(290,360);
  vertex(310,360);
  vertex(310,340);
  vertex(330,340);
  vertex(330,320);
  vertex(350,320);
  vertex(350,250);
  vertex(370,250);
  vertex(370,270);
  vertex(390,270);
  vertex(390,230);
  vertex(350,230);
  vertex(350,190);
  vertex(440,190);
  vertex(440,170);
  vertex(370,170);
  vertex(370,150);
  vertex(490,150);
  vertex(490,70);
  vertex(470,70);
  vertex(470,50);
  vertex(280,50); 
  vertex(280,70); 
  vertex(260,70);
  vertex(260,190);
  vertex(240,190);
  vertex(240,210);
  vertex(220,210);
  vertex(220,230);
  vertex(200,230);
  vertex(200,250);
  vertex(180,250);
  vertex(180,270);
  vertex(160,270);
  vertex(160,290);
  vertex(110,290);
  vertex(110,270);
  vertex(90,270);
  vertex(90,250);
  vertex(70,250);
  vertex(70,200);
  vertex(50,200);
  endShape();
  // Se pinta de color blanco el ojo.
  fill(255);
  rect(300,70,20,20);
  
}
