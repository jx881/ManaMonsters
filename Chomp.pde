class Chomp{
  String bites;
  int x, y, w;
  
Chomp(int cx, int cy, int cw) {
  x = cx;
  y = cy;
  w = cw;
 
}

void display() {
  fill (0);
    ellipse(x,y, w, w);
    
}
}
