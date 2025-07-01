import processing.sound.*;
import processing. sound. FFT;

SoundFile soundfile;
FFT fft;

int x=0;
int y=70;

float radio;

void setup(){
  size (800, 800);
  background (0);
  frameRate(10);
  
  soundfile = new SoundFile (this, "Clocks.mp3");
}

void draw (){
 float numAleatorio=random (0,1);
 radio= (numAleatorio * width);
 
 fill (255, 30);
 stroke (random (100, 150), random (150, 255), random (200, 255));
 ellipse (x, y, radio, radio);
 
 x += 70;
 
 if (x> width){
   x=0;
   y=y + 70;
 }
 
 if (y > height){
   y = 70;
   background (0);
 }  
}
