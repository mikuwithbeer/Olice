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
  Olice -i MIT --stdout
  Olice --target LICENSE.md`

main :: proc() {
	exit_code := 1

	interface := make_interface()
	action, err := load_interface(&interface, os.args)
	if err != .None {
		print_error(err)
		os.exit(exit_code)
	}

	switch action {
	case .Write:
		exit_code = action_write(&interface)
	case .Help:
		exit_code = action_help(&interface)
	case .List:
		exit_code = action_list(&interface)
	case .Version:
		exit_code = action_version(&interface)
	}

	os.exit(exit_code)
}

action_write :: proc(interface: ^Interface) -> int {
	license, err := find_license(interface.identifier)
	if err != .None {
		print_error(err)
		return 1
	}

	writer := make_writer(interface.target, interface.stdout)
	if err := load_writer(&writer, license.text); err != .None {
		print_error(err)
		return 1
	}

	if !interface.stdout {
		fmt.printfln(
			"Generated \e[1;37m%s\e[0m and saved to: \e[1;37m%s\e[0m",
			license.name,
			interface.target,
		)

		fmt.printfln("\e[0;34mNote:\e[0m Please review the file for manual updates.")
	}

	return 0
}

action_help :: proc(interface: ^Interface) -> int {
	fmt.println(OLICE_HELP)
	return 0
}

action_list :: proc(interface: ^Interface) -> int {
	for license in LICENSES {
		rate := encode_license_rate(license.rate)
		kind := encode_license_kind(license.kind)

		fmt.printfln("- (\e[0;33m%s\e[0m) \e[1;37m%s:\e[0m %s", rate, kind, license.name)
	}

	return 0
}

action_version :: proc(interface: ^Interface) -> int {
	fmt.printfln("Olice v%s", OLICE_VERSION)
	return 0
}
