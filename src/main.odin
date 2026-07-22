package main

import "core:fmt"
import "core:os"

main :: proc() {
	interface := make_interface()
	if err := load_interface(&interface, os.args); err != .None {
		fmt.println(encode_error(err))
		os.exit(1)
	}

	license, err := find_license(interface.identifier)
	if err != .None {
		fmt.println(encode_error(err))
		os.exit(1)
	}

	writer := make_writer(interface.target, interface.stdout)
	if err := load_writer(&writer, license.text); err != .None {
		fmt.println(encode_error(err))
		os.exit(1)
	}

	if !interface.stdout {
		fmt.printfln("Generated %s and saved to: %s", license.name, interface.target)
		fmt.printfln("Note: Please review the file, as some licenses require manual updates.")
	}
}
