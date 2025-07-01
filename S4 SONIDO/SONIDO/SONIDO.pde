import processing.sound.*;
import processing.sound.FFT;

SoundFile soundfile;
FFT fft;

int bands = 256;

float[] spectrum = new float[bands];

int x = 0;
int y = 70;

float radio;

void setup(){
  size (800, 800);
  background (255);
 
  soundfile = new SoundFile(this, "Clocks.mp3");
 
  fft = new FFT (this, bands);
  
  fft.input (soundfile);
  
  soundfile.play();
}

void draw (){
  fft.analyze(spectrum);
  
  //float randomFreq = random (255)
 float level = spectrum[50] * 100;
 radio= (level * width);
 
 radio = constrain (radio, 10, 500);
 
 noStroke ();
 
 fill (random (180, 200), random (210, 230), random(240, 255));
 ellipse (x, y, radio, radio);
 fill (random (240, 250), random (200, 205), random (245, 255));
 rect (x, y, radio, radio);
 fill (random (220, 240), random (180, 200), random (240, 255));
 arc (x, y, radio, radio, 2, 5);
 
 x += 10;
 
 if (x> width){
   x = 0;
   y = y + 10;
 }
 
 if (y > height){
   y = 70;
   background (0);
 }  
}
