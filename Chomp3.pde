class Chomp3{
  String bites3;
  int cx2, cy2, cw2;
  
Chomp3(int _cx2, int _cy2, int _cw2) {
  cx2 = _cx2;
  cy2 = _cy2;
  cw2 = _cw2;
 
}

void display() {
  fill (255);
    ellipse(cx2,cy2, cw2, cw2);
    
}
}
