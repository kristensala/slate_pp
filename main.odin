package main

import "core:fmt"
import sdl "vendor:sdl3"

main :: proc() {
	window := sdl.CreateWindow("Slate++", 1500, 1500, {})
	if window == nil {
		fmt.eprintln("Could not create a window")
		return
	}
	defer sdl.DestroyWindow(window)

	renderer := sdl.CreateRenderer(window, nil)
	if renderer == nil {
		fmt.eprintln("Could not create a renderer: ", sdl.GetError())
		return
	}
	defer sdl.DestroyRenderer(renderer)

	bg_color := sdl.Color{13, 54, 21, 0}

	running := true
	game_loop: for (running) {
		event: sdl.Event
		for sdl.PollEvent(&event) {
			#partial switch event.type {
			case .QUIT:
				running = false
				break game_loop
			}
        }

        sdl.SetRenderDrawColor(
            renderer,
            bg_color.r,
            bg_color.g,
            bg_color.b,
            bg_color.a
        )

		// Drawing should be done between RenderClear and RenderPresent
		sdl.RenderClear(renderer)

		sdl.SetRenderClipRect(renderer, &sdl.Rect{0, 0, 1500, 1500})

		sdl.RenderPresent(renderer)
	}
}
