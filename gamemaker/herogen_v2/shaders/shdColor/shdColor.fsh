//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_color;

void main()
{
	vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord );
	// vec4 finalCol = mix(texColor,vec4(u_color,texColor.a),0.5);
	float red = clamp(u_color.r+texColor.r-1.0,0.0,1.0);
	float green = clamp(u_color.g+texColor.g-1.0,0.0,1.0);
	float blue = clamp(u_color.b+texColor.b-1.0,0.0,1.0);
	vec4 finalCol = vec4(red,green,blue,texColor.a);
	
    gl_FragColor = v_vColour * finalCol;
}
