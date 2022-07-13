//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	col.r *= 0.35;
	col.g *= 0.35;
	col.b *= 0.35;
    gl_FragColor = col;
}
