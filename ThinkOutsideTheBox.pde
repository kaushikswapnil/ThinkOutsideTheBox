int g_NumBoxes = 300;
float g_AngSpeed = 10.0f;

void setup()
{
   size(1000, 1000, P3D);
}

void draw()
{
  background(color(#0C7EFA));
  
  noFill();
  translate(width/2, height/2, 0);
  float curTime = millis()/1000.0f;
  
  float scaleMajor = map(sin(radians(curTime * 10.0f)), -1.0f, 1.0f, -0.5f, 0.3f);
  float scaleAdd = scaleMajor + map(sin(radians(curTime * 50.0f)), -1.0f, 1.0f, 0.0f, 0.3f);
  
  for (int iter = 0; iter < g_NumBoxes; ++iter)
  {
    pushMatrix();
    
    float angRange = map(sin(radians(curTime * 10.0f)), -1.0f, 1.0f, PI/3, TWO_PI);
    float ang = PI/4 + angRange + radians(curTime * g_AngSpeed * (float)(iter+1)/g_NumBoxes);
    
    stroke(lerpColor(color(#ffffff), color(#FFC300), (float)iter/(g_NumBoxes-1)));
    strokeWeight(map((float)iter/(g_NumBoxes-1), 0.0f, 1.0f, 0.08f, 1.8f));
    
    rotateX(ang);
    rotateY(ang);
    rotateZ(ang);
    
    float scale = 1.0f - ((float)iter/(g_NumBoxes-1));
    scale = map(scale, 0.0f, 1.0f, scaleAdd, 1.0f + scaleAdd);
    box(scale * width * 0.5f);
    popMatrix();
  }
}
