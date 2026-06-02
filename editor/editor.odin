package editor

Editor :: struct {
    x, y, w, h: i32,
    cursor: ^Cursor
}

Cursor :: struct {
    x, y, w, h: i32,

    line_nr: i32,
    col_nr: i32,
    mem_col_nr: i32,
}

@(require_results)
@(private = "package")
init_editor :: proc() -> ^Editor  {
	editor := new(Editor)
	return editor
}
