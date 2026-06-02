package editor

import "core:c"
import "core:os"
import "vendor:sdl3/ttf"
import sdl "vendor:sdl3"

import kbts "vendor:kb_text_shape"

Atlas :: struct {
	texture: ^sdl.Texture,
	surface: ^sdl.Surface,
	w, h: i32,
	font: ttf.Font,
	font_line_skip: i32,
	font_ascent: i32,
	font_descent: i32,
	glyphs: map[int]Glyph // key is codepoint
}

Glyph :: struct {
	uv: sdl.Rect,
	w, h: i32,
	advance: i32 // how much to move the cursor
}

init_atlas :: proc{
	build_atlas
}

@(private = "file")
@(require_results)
build_atlas :: proc(renderer: ^sdl.Renderer, font_file: string ) -> (_atlas: ^Atlas, ok: bool) {
	atlas := new(Atlas)

    // Basic
    /*odin_allocator := context.allocator

    font_data, _ := os.read_entire_file(font_file, odin_allocator)

    ctx := kbts.CreateShapeContext(kbts.AllocatorFromOdinAllocator(&odin_allocator))
    kbts.ShapePushFontFromMemory(ctx, font_data, 0)

    kbts.ShapeBegin(ctx, .DONT_KNOW, .DONT_KNOW)
    kbts.ShapeUtf8(ctx, "Let's shape something!", .CODEPOINT_INDEX)
    kbts.ShapeEnd(ctx)

    cursor_x, cursor_y: c.int = 0, 0

    for Run in kbts.ShapeRun(ctx) {
        Run := Run
        for glyph in kbts.GlyphIteratorNext(&Run.Glyphs) {
            GlyphX := cursor_x + glyph.OffsetX
            GlyphY := cursor_y + glyph.OffsetY

            //DisplayGlyph(Glyph.Id, GlyphX, GlyphY)

            cursor_x += glyph.AdvanceX
            cursor_y += glyph.AdvanceY
        }
    }*/
	return atlas, true
}
