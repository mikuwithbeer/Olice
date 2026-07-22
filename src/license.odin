package main

import "core:strings"

License_Kind :: enum {
	BlueOak_1_0_0,
	Bsd_2_Clause_Patent,
	Amazon_Digital_Services,
}

License_Error :: enum {
	None,
	Failed_To_Lower,
	Unknown_License,
}

License :: struct {
	kind: License_Kind,
	name: string,
	text: string,
}

LICENSES :: [?]License {
	License {
		kind = .BlueOak_1_0_0,
		name = "Blue Oak Model License 1.0.0",
		text = #load("../text/BLUEOAK-1.0.0"),
	},
	License {
		kind = .Bsd_2_Clause_Patent,
		name = "BSD-2-Clause Plus Patent License",
		text = #load("../text/BSD-2-CLAUSE-PATENT"),
	},
	License {
		kind = .Amazon_Digital_Services,
		name = "Amazon Digital Services License",
		text = #load("../text/ADSL"),
	},
}

@(require_results)
encode_license_kind :: proc(kind: License_Kind) -> string {
	switch kind {
	case .BlueOak_1_0_0:
		return "blueoak-1.0.0"
	case .Bsd_2_Clause_Patent:
		return "bsd-2-clause-patent"
	case .Amazon_Digital_Services:
		return "adsl"
	case:
		return "unknown"
	}
}

@(require_results)
decode_license_kind :: proc(value: string) -> (License_Kind, License_Error) {
	lower, err := strings.to_lower(value)
	if err != .None {
		return {}, .Failed_To_Lower
	}

	defer delete(lower)

	switch lower {
	case "blueoak-1.0.0":
		return .BlueOak_1_0_0, .None
	case "bsd-2-clause-patent":
		return .Bsd_2_Clause_Patent, .None
	case "adsl":
		return .Amazon_Digital_Services, .None
	case:
		return {}, .Unknown_License
	}
}

@(require_results)
find_license :: proc(kind: License_Kind) -> (License, License_Error) {
	for license in LICENSES {
		if license.kind == kind {
			return license, .None
		}
	}

	return {}, .Unknown_License
}
