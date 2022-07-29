shader_type canvas_item;

uniform float blur_amount : hint_range(0, 5);
uniform float mix_amount : hint_range(0, 5);

void fragment() {
	vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
	vec4 blur = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur_amount);
	COLOR = mix(black, blur, mix_amount);
}
