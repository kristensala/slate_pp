package editor

import sdl "vendor:sdl3"

Viewport :: enum {
	COMMAND_PALLETE,
	EDITOR
}

Application_State :: struct {
    window: ^sdl.Window,
    renderer: ^sdl.Renderer,
    texture: ^sdl.Texture,

	editor: ^Editor,
	command_palette: ^Command_Palette,
	active_viewport: Viewport,
	glyph_atlas: ^Atlas
}

init_application :: proc() {
}
