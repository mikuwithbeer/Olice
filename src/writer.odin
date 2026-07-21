package main

import "core:os"

Writer_Error :: enum {
	None,
	Failed_To_Open,
	Failed_To_Write,
}

Writer :: struct {
	target: string,
	stdout: bool,
}

make_writer :: proc(target: string, stdout: bool) -> Writer {
	return Writer{target, stdout}
}

@(require_results)
load_writer :: proc(writer: ^Writer, value: string) -> Writer_Error {
	file: ^os.File
	err: os.Error

	if writer.stdout {
		file = os.stdout
	} else {
		file, err = os.open(writer.target, {.Create, .Write})
		if err != os.ERROR_NONE {
			return .Failed_To_Open
		}
	}

	_, err = os.write_string(file, value)
	if err != os.ERROR_NONE {
		return .Failed_To_Write
	}

	return .None
}
