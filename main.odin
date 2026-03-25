package main

import "core:fmt"
import sdl "vendor:sdl3"

main :: proc() {
	fmt.println("Hellope")

	window := sdl.CreateWindow("title", 1500, 1500, {})
	defer sdl.DestroyWindow(window)
}
