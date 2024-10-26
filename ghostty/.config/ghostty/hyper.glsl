const bool noise = true;
const float noiseLevel = 0.1;

void drawgrid(vec2 uv, float pos, float width, vec3 color, inout vec3 pixel) {
	if((abs(0.2*sin(iTime)+uv.x - pos)) < width || (abs(mod(iTime,1.0)+uv.y - pos)) < width)
	//if(abs(uv.x - pos) < width || abs(uv.y - pos) < width)

    // twirly
    //if((abs(0.2*sin(iTime)+uv.x+(0.3*cos(uv.x+iTime)) - pos)) < width || (abs(mod(iTime,1.0)+uv.y+(sin(uv.x+iTime)) - pos)) < width)

    pixel = color;
	//	if(abs(uv.y - pos) < width && horizontal)
}


float hash(in float n) { return fract(sin(n)*43758.5453123); }

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
//	vec2 uv = fragCoord.xy / iResolution.xy;
   	vec2 uv = (2.0*fragCoord.xy - iResolution.xy) / iResolution.y;
    vec2 realuv = uv;

    // reshape and flip it upside down
    uv.xy /= 1.0-uv.y*2.0;

    vec3 bgColor = vec3 (0.0);
	vec3 gridColor = vec3(0.13, 0.92, 0.23);
	vec3 pixel = bgColor; // set default color to background
	
    uv *= 2.0;
    
	const float lineStep = 0.2;
    vec2 pos = vec2(0.0);

    for(float i = -10.0; i < 11.0; i+=lineStep) {
	    drawgrid(uv, i, 0.006, gridColor, pixel);
    }
	
	fragColor = vec4(pixel, 1.0);
    
    // fade out top
    fragColor *= 0.5-realuv.y;
    
    if (noise) {
        float noise = hash((hash(fragCoord.x) + fragCoord.y) * iTime) * noiseLevel;
    	fragColor += noise;
    }
    
    // vec2 uv = fragCoord/iResolution.xy;
    vec4 terminalColor = texture(iChannel0, uv);
    float mask = 1.0 - step(0.5, dot(terminalColor.rgb, vec3(1.0)));
    vec3 blendedColor = mix(terminalColor.rgb, fragColor.rgb, mask);
    fragColor = vec4(blendedColor, terminalColor.a);
}
