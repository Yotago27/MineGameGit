//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	col.g = ((col.r + col.g + col.b) / 3.0);
	
	
	col.r *= 0.0;
	col.g = (((col.r + col.g + col.b) / 3.0) + 0.2);
	col.b *= 0.0;
	col.a = col.a * 10000.0;
	
    gl_FragColor = col;
}
