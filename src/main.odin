package main

import "core:fmt"
import "core:mem/virtual"
import "core:os"

OLICE_VERSION :: #config(VERSION, "0.0.0")
OLICE_HELP :: `Usage: Olice [OPTIONS]

Options:
  -i, --identifier <license>  The license identifier to generate (e.g., 'mit', 'apache-2.0').
  -t, --target <file>         Where to save the generated license file (defaults to 'LICENSE').
  -n, --name <string>         Copyright holder(s) name to include in the license.
  -y, --year <string>         Copyright year to include in the license.
  -s, --stdout                Print the license to the terminal instead of saving it.
  -l, --list                  Show the menu of all available licenses.
  -v, --version               Print the current version.
  -h, --help                  Show this helpful message.

Examples:
  Olice --list
  Olice -i Apache-2.0
  Olice -i MIT --name "John Doe" --year 2026
  Olice -i BlueOak-1.0.0 --target LICENSE.md
  Olice -i 0BSD --stdout`

main :: proc() {
	exit_code := 1

	interface := make_interface()
	action, err := load_interface(&interface, os.args)
	if err != .None {
		print_error(err)
		os.exit(exit_code)
	}

	arena: virtual.Arena
	context.allocator = virtual.arena_allocator(&arena)

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

	virtual.arena_destroy(&arena)
	os.exit(exit_code)
}

action_write :: proc(interface: ^Interface) -> int {
	license, err := find_license(interface.identifier)
	if err != .None {
		print_error(err)
		return 1
	}

	text := fill_license(&license, interface.name, interface.year)

	writer := make_writer(interface.target, interface.stdout)
	if err := load_writer(&writer, text); err != .None {
		print_error(err)
		return 1
	}

	if !interface.stdout {
		fmt.printfln("Saved \e[1;37m%s\e[0m to \e[1;37m%s\e[0m", license.name, interface.target)
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
