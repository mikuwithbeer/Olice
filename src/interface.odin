package main

Interface_Error :: enum {
	None,
	Unknown_Identifier,
	Unknown_Option,
}

Interface_State :: enum {
	Default,
	Identifier,
	Target,
}

Interface_Action :: enum {
	Write,
	Help,
	List,
	Version,
}

Interface :: struct {
	state:      Interface_State,
	identifier: License_Kind,
	target:     string,
	stdout:     bool,
	help:       bool,
	list:       bool,
	version:    bool,
}

make_interface :: proc() -> Interface {
	return Interface {
		state = .Default,
		identifier = .BlueOak_1_0_0,
		target = "LICENSE",
		stdout = false,
		help = false,
		list = false,
		version = false,
	}
}

@(require_results)
load_interface :: proc(
	interface: ^Interface,
	arguments: []string,
) -> (
	Interface_Action,
	Interface_Error,
) {
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
			case "-h", "--help":
				interface.help = true
			case "-l", "--list":
				interface.list = true
			case "-v", "--version":
				interface.version = true
			case:
				return {}, .Unknown_Option
			}
		case .Identifier:
			identifier, err := decode_license_kind(argument)
			if err != .None {
				return {}, .Unknown_Identifier
			}

			interface.state = .Default
			interface.identifier = identifier
		case .Target:
			interface.state = .Default
			interface.target = argument
		}
	}

	if interface.help {
		return .Help, .None
	} else if interface.list {
		return .List, .None
	} else if interface.version {
		return .Version, .None
	} else {
		return .Write, .None
	}
}
