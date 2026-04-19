shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;
uniform int pixel_size : hint_range(1, 64) = 2; // Pixel size
uniform vec2 screen_size = vec2(1280.0, 720.0); // Screen size (set manually)

void fragment() {
    // Convert fragment coordinates to UV space
    vec2 uv = FRAGCOORD.xy / screen_size;

    // Adjust pixelation to ensure clean stepping at odd values
    vec2 pixelated_uv = floor(uv * screen_size / float(pixel_size)) * float(pixel_size) / screen_size;

    // Sample the screen texture
    COLOR = texture(SCREEN_TEXTURE, pixelated_uv);
}
