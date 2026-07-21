package main

import "core:fmt"
import "core:os"

main :: proc() {
	interface := make_interface()
	if err := load_interface(&interface, os.args); err != .None {
		fmt.println("err:", err)
		os.exit(1)
	}

	license, err := find_license(interface.identifier)
	if err != .None {
		fmt.println("err:", err)
		os.exit(1)
	}

	writer := make_writer(interface.target, interface.stdout)
	if err := load_writer(&writer, license.text); err != .None {
		fmt.println("err:", err)
		os.exit(1)
	}
}
