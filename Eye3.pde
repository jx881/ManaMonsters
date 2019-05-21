class Eye3
{
    float eyeSize3;
    float pupilSize3;
    float eyeDistance3;
    float eyeX3;
    float eyeY3;
    float pupilX3;
    float pupilY3;
    
    Eye3(float x3, float y3, float e3)
    {
        eyeSize3 = 40;
        pupilSize3 = 15;
        eyeX3 = x3;
        eyeY3 = y3;
        eyeDistance3 = e3;
        
        pupilX3 = eyeX3;
        pupilY3 = eyeY3;
    }
    void update()
    {
        float mY3 = map(mouseY, 0, height, -eyeSize3/4, eyeSize3/4);
        pupilY3 = eyeY3 + mY3;

        float mX3 = map(mouseX, 0, height, -eyeSize3/4, eyeSize3/4);
        pupilX3 = eyeX3 + mX3;
    }
    
    void draw()
    {
        // stroke around eyeball
        fill(0);
        ellipse(eyeX3, eyeY3, eyeSize3 + 4, eyeSize3 + 4);
        
        // eyeball
        fill(255);
        ellipse(eyeX3, eyeY3, eyeSize3, eyeSize3);
        
        // pupil
        fill(0);
        ellipse(pupilX3, pupilY3, pupilSize3, pupilSize3);    
    }
}
