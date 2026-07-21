package main

import "core:fmt"
import "core:os"

main :: proc() {
	interface := make_interface()
	if err := load_interface(&interface, os.args); err != .None {
		fmt.println("err:", err)
		os.exit(1)
	}

	writer := Writer {
		target = interface.target,
		stdout = interface.stdout,
	}

	for license in LICENSES {
		if license.kind != interface.identifier {
			continue
		}

		if err := load_writer(&writer, license.text); err != .None {
			fmt.println("err:", err)
			os.exit(1)
		}

		break
	}
}
