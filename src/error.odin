package main

import "core:fmt"
import "core:os"

Error :: union {
	Interface_Error,
	License_Error,
	Writer_Error,
}

print_error :: proc(err: Error) {
	fmt.fprint(os.stderr, "\e[0;31mError:\e[0m ")

	switch e in err {
	case Interface_Error:
		#partial switch e {
		case .Unknown_Identifier:
			fmt.fprintln(os.stderr, "Unrecognized identifier. Please check for typos.")
			return
		case .Unknown_Option:
			fmt.fprintln(os.stderr, "Unknown option provided. Verify the flag name.")
			return
		}
	case License_Error:
		#partial switch e {
		case .Failed_To_Lower:
			fmt.fprintln(os.stderr, "Failed to lowercase the license string.")
			return
		case .Unknown_License:
			fmt.fprintln(os.stderr, "Unknown license. Please verify the name and spelling.")
			return
		}
	case Writer_Error:
		#partial switch e {
		case .Failed_To_Open:
			fmt.fprintln(os.stderr, "Failed to open the file.")
			return
		case .Failed_To_Write:
			fmt.fprintln(os.stderr, "Failed to write to the file.")
			return
		case .Failed_To_Close:
			fmt.fprintln(os.stderr, "Failed to close the file.")
			return
		}
	}

	fmt.fprintln(os.stderr, "An unexpected error occurred. Please report the issue.")
}
