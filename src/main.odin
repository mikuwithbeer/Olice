package main

import "core:fmt"
import "core:os"

OLICE_VERSION :: #config(VERSION, "0.0.0")
OLICE_HELP :: `Usage: Olice [OPTIONS]

Options:
  -i, --ident, --identifier <license>  The license identifier to generate (e.g., 'mit', 'apache-2.0').
  -t, --target <file>                  Where to save the generated license file (defaults to 'LICENSE').
  -s, --stdout                         Print the license to the terminal instead of saving it.
  -l, --list                           Show the menu of all available licenses.
  -v, --version                        Print the current version.
  -h, --help                           Show this helpful message.

Examples:
  Olice --version
  Olice -i mit --stdout
  Olice --identifier blueoak-1.0.0 -t LICENSE.md`

main :: proc() {
	interface := make_interface()
	action, err := load_interface(&interface, os.args)
	if err != .None {
		fmt.println(encode_error(err))
		os.exit(1)
	}

	action_result: int
	switch action {
	case .Write:
		action_result = action_write(&interface)
	case .Help:
		action_result = action_help(&interface)
	case .List:
		action_result = action_list(&interface)
	case .Version:
		action_result = action_version(&interface)
	}

	os.exit(action_result)
}

action_write :: proc(interface: ^Interface) -> int {
	license, err := find_license(interface.identifier)
	if err != .None {
		fmt.println(encode_error(err))
		return 1
	}

	writer := make_writer(interface.target, interface.stdout)
	if err := load_writer(&writer, license.text); err != .None {
		fmt.println(encode_error(err))
		return 1
	}

	if !interface.stdout {
		fmt.printfln("Generated %s and saved to: %s", license.name, interface.target)
		fmt.printfln("Note: Please review the file, as some licenses require manual updates.")
	}

	return 0
}

action_help :: proc(interface: ^Interface) -> int {
	fmt.println(OLICE_HELP)
	return 0
}

action_list :: proc(interface: ^Interface) -> int {
	fmt.println("Here are the available licenses:")
	for license in LICENSES {
		kind := encode_license_kind(license.kind)
		rate := encode_license_rate(license.rate)

		fmt.printfln("- %s (%s): %s", kind, rate, license.name)
	}

	return 0
}

action_version :: proc(interface: ^Interface) -> int {
	fmt.printfln("Olice v%s", OLICE_VERSION)
	return 0
}
