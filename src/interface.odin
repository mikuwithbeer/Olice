package main

Interface_State :: enum {
	Default,
	Identifier,
	Target,
}

Interface_Error :: enum {
	None,
	Unknown_Identifier,
	Unknown_Option,
}

Interface :: struct {
	state:      Interface_State,
	identifier: License_Kind,
	target:     string,
	stdout:     bool,
}

make_interface :: proc() -> Interface {
	return Interface {
		state = .Default,
		identifier = .BlueOak_1_0_0,
		target = "LICENSE",
		stdout = false,
	}
}

@(require_results)
load_interface :: proc(interface: ^Interface, arguments: []string) -> Interface_Error {
	for argument in arguments[1:] {
		switch interface.state {
		case .Default:
			switch argument {
			case "-i", "--ident", "--identifier":
				interface.state = .Identifier
			case "-t", "--target":
				interface.state = .Target
			case "-s", "--stdout":
				interface.stdout = true
			case:
				return .Unknown_Option
			}
		case .Identifier:
			identifier, err := license_kind_decode(argument)
			if err != .None {
				return .Unknown_Identifier
			}

			interface.state = .Default
			interface.identifier = identifier
		case .Target:
			interface.state = .Default
			interface.target = argument
		}
	}

	return .None
}
