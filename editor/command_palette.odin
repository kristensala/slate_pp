package editor

import sdl "vendor:sdl3"

Command_Palette :: struct {
	command: ^[]rune, // input

	viewport: sdl.Rect
}

open_command_palette :: proc() {

}
