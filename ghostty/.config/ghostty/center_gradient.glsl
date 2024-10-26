void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalize pixel coordinates (range from 0 to 1)
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Define gradient colors (adjust to your preference)
    // vec3 gradientStartColor = vec3(.14, 0.15, 0.22);
    // vec3 gradientEndColor = vec3(0.0);

    // # 22272e
    // vec3(0.133, 0.153, 0.180)

    vec3 gradientStartColor = vec3(0.153, 0.173, 0.200);
    vec3 gradientEndColor = vec3(0.113, 0.123, 0.160);

    // Distance from normalized point. 0.5, 0.5 is center
    float mixValue = distance(uv, vec2(0.5, 0.5));

    vec3 gradientColor = mix(gradientStartColor, gradientEndColor, mixValue);

    // Sample the terminal screen texture including alpha channel
    vec4 terminalColor = texture(iChannel0, uv);

    // Make a mask that is 1.0 where the terminal content is not black
    float mask = 1.0 - step(0.5, dot(terminalColor.rgb, vec3(1.0)));
    vec3 blendedColor = mix(terminalColor.rgb, gradientColor, mask);

    // Apply terminal's alpha to control overall opacity
    fragColor = vec4(blendedColor, terminalColor.a);
}
