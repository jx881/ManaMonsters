class Tentacle{
  float x0,y0,theta0;
  float[] segLengths;
  float[] segThetas;
  
  Tentacle(float x0i, float y0i, float theta0i){
    x0 = x0i;
    y0 = y0i;
    theta0 = theta0i;
  
    baseLength = totalLength*(downScaling-1)/(pow(downScaling,nSegs)-1);
    
    segLengths = new float[nSegs];
    segThetas = new float[nSegs];
    for(int i=0; i<nSegs; i++){
      if(i==0)
        segLengths[i] = baseLength*0.85;
      else
        segLengths[i] = segLengths[i-1]*downScaling;
    }
  }
  

    

  void drawTentacle(){
    float x1 = x0;
    float y1 = y0;
    float x2 = x0;
    float y2 = y0;
    float totalTheta=theta0;
    for(int i=0; i<nSegs; i++){
      stroke(tentacleColor);
      strokeWeight(baseThickness*segLengths[i]*2.5/segLengths[0]);
      totalTheta+=segThetas[i];
      x2 = x1+segLengths[i]*cos(totalTheta);
      y2 = y1+segLengths[i]*sin(totalTheta);
      line(x1,y1,x2,y2);
      if(drawSuckers){
        fill(suckerColor);
        stroke(suckerOutlineColor);
        strokeWeight(1);
        ellipse((x1+x2)/2,(y1+y2)/2,
                baseThickness*segLengths[i]/segLengths[0]*suckerScale,
                baseThickness*segLengths[i]/segLengths[0]*suckerScale);

      }
      x1 = x2;
      y1 = y2;
    }
  }
  
  
  float[] segVelocities = new float[nSegs];
  void wiggleTentacle(){
    for(int i = 0; i<nSegs; i++){
      //check for boundaries
      if(segThetas[i] <= -maxdTheta || segThetas[i] >= maxdTheta)
        segVelocities[i] = 0;
    }
    //trickle-down velocity
    for(int i = nSegs-2; i>=0; i--){
      segVelocities[i] += segVelocities[i+1]*trickleVelScaling*2.5; 
    }
    
    //change tip velocity a bit!
    segVelocities[nSegs-1] += random(-maxdThetaVelPerStep,maxdThetaVelPerStep)*2;
    
    //limit velocities, eliminating sudden stops
    int sign = 1;
    for(int i = 0; i<nSegs; i++){
      if(segThetas[i]>0 && segVelocities[i]>0){
        segVelocities[i] = min(segVelocities[i],
                               maxThetaVel*(1-segThetas[i]/maxdTheta));
      }
    if(segThetas[i]<0 && segVelocities[i]<0){
        segVelocities[i] = min(abs(segVelocities[i]),
                               maxThetaVel*(1-abs(segThetas[i])/maxdTheta));
        segVelocities[i] = -segVelocities[i];
      }
    }
    
    //move everyone
    for(int i = 0; i<nSegs; i++){
      segThetas[i] = constrain(segThetas[i]+segVelocities[i],
                               -maxdTheta*(1-i/nSegs),
                               maxdTheta*(1-i/nSegs));
    }
  }
}
