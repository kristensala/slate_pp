package editor

import "core:fmt"
import sdl "vendor:sdl3"

run :: proc() {
    app_state := new(Application_State)

	app_state.window = sdl.CreateWindow("Slate++", 1500, 1500, {.RESIZABLE})
	if app_state.window == nil {
		fmt.eprintln(#procedure, "Could not create a window")
		return
	}
	defer sdl.DestroyWindow(app_state.window)

    app_state.editor = init_editor()

	app_state.renderer = sdl.CreateRenderer(app_state.window, nil)
	if app_state.renderer == nil {
		fmt.eprintln(#procedure, "Could not create a renderer: ", sdl.GetError())
		return
	}
	defer sdl.DestroyRenderer(app_state.renderer)

    app_state.texture = sdl.CreateTexture(app_state.renderer, .ARGB8888, .STREAMING, 800, 600)
    if app_state.texture == nil {
		fmt.eprintln(#procedure, "Could not create a texture: ", sdl.GetError())
		return
    }
    defer sdl.DestroyTexture(app_state.texture)

	running := true
	main_loop: for (running) {
		event: sdl.Event
		for sdl.PollEvent(&event) {
			#partial switch event.type {
            case .KEY_DOWN: {
            }
			case .QUIT: {
                running = false
                break main_loop
            }
        }
		}

		draw(app_state)
	}
}

@(private = "file")
draw :: proc(app_state: ^Application_State) {
    pixels: rawptr
    pitch: i32

    sdl.SetRenderDrawColor(
        app_state.renderer,
        BG_COLOR.r,
        BG_COLOR.g,
        BG_COLOR.b,
        BG_COLOR.a
    )

    sdl.LockTexture(app_state.texture, nil, &pixels, &pitch)

    draw_rect(pixels, pitch, 100, 200, 300, 200, 0xFFFF0000)
    draw_rect(pixels, pitch, 30, 10, 10, 5, 0xFFFF0000)

    sdl.UnlockTexture(app_state.texture)

	sdl.RenderClear(app_state.renderer)
    sdl.RenderTexture(app_state.renderer, app_state.texture, nil, nil)
	sdl.RenderPresent(app_state.renderer)
}

@(private = "file")
draw_rect :: proc(
    pixels: rawptr,
    pitch: i32,
    x, y, w, h: int,
    color: u32,
) {
    base := cast([^]u8)pixels

    for py in y..<y+h {
        row_ptr := &base[uintptr(py) * uintptr(pitch)]
        row := cast([^]u32)(row_ptr)

        for px in x..<x+w {
            row[px] = color
        }
    }
}
