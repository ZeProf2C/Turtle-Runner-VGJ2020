local pixel_lampeTorche = [[
extern vec2 mouse;
extern int rayon;
extern float light;

float tweenPow(float k , float t , float T , float D , float A)
{
  float C = A-D ;
  return C*pow(t/T,k) +  D;
}

vec4 effect( vec4 color , Image tex , vec2 tex_coords , vec2 screen_coords)
{
  vec4 texcolor = Texel(tex, tex_coords);
  float dist = length(mouse - screen_coords);
  if (dist < rayon)
  {
    float alpha = tweenPow(light,dist,rayon,1,0);
    color = vec4(1,1,1,alpha);
  }
  else
  {
  color = vec4(0,0,0,0);
  }
  return texcolor * color;
}

]]

shader = love.graphics.newShader(pixel_lampeTorche)

lampe ={}
lampe.r = 425
lampe.eclairage = 1