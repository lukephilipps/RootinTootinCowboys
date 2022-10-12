//
// Outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;

void main()
{
	vec2 offsetX;
	offsetX.x = pixelW;
	vec2 offsetY;
	offsetY.y = pixelH;
	
	bool outline_pixel = false;
	bool changed = false;
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	if (alpha == 0.0) outline_pixel = true;
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetX).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetX).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetY).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetY).a);
	
	if (alpha > 0.0) changed = true;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (changed && outline_pixel) gl_FragColor = vec4(1.0, 1.0, 1.0, 1);
}
