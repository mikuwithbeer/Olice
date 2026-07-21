package main

import "core:strings"

License_Kind :: enum {
	BlueOak_1_0_0,
	Bsd_2_Clause_Patent,
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
	License{.BlueOak_1_0_0, "Blue Oak Model License 1.0.0", #load("../text/BLUEOAK-1.0.0")},
	License {
		.Bsd_2_Clause_Patent,
		"BSD-2-Clause Plus Patent License",
		#load("../text/BSD-2-CLAUSE-PATENT"),
	},
}

/*
license_kind_encode :: proc(kind: License_Kind) -> Maybe(string) {
	switch kind {
	case .BlueOak_1_0_0:
		return "blueoak-1.0.0"
	case .Bsd_2_Clause_Patent:
		return "bsd-2-clause-patent"
	case:
		return nil
	}
}
*/

license_kind_decode :: proc(value: string) -> (License_Kind, License_Error) {
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
	case:
		return {}, .Unknown_License
	}
}
