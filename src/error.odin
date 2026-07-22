package main

Error :: union {
	Interface_Error,
	License_Error,
	Writer_Error,
}

encode_error :: proc(err: Error) -> string {
	switch e in err {
	case Interface_Error:
		#partial switch e {
		case .Unknown_Identifier:
			return "Unrecognized identifier. Please check for typos."
		case .Unknown_Option:
			return "Unknown option provided. Verify the flag name."
		}
	case License_Error:
		#partial switch e {
		case .Failed_To_Lower:
			return "Failed to lowercase the license string. This is likely an allocator issue."
		case .Unknown_License:
			return "Unknown license. Please verify the name and spelling."
		}
	case Writer_Error:
		#partial switch e {
		case .Failed_To_Open:
			return "Failed to open the file. Check file permissions or lock status."
		case .Failed_To_Write:
			return "Failed to write to the file. Verify available disk space."
		}
	}

	return "An unexpected error occurred. Please report the issue."
}
