varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	if (texColor.a > 0.0) texColor.a = .5;
	
    gl_FragColor = texColor;
}
