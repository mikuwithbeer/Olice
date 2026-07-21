package main

import "core:fmt"
import "core:os"

main :: proc() {
	interface := make_interface()
	if err := load_interface(&interface, os.args); err != .None {
		fmt.println("err:", err)
		os.exit(1)
	}

	fmt.println(interface)
}
