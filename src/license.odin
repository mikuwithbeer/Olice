package main

License_Kind :: enum {
	BlueOak_1_0_0,
	Bsd_2_Clause_Patent,
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

license_name :: proc(kind: License_Kind) -> string {
	switch kind {
	case .BlueOak_1_0_0:
		return "blueoak-1.0.0"
	case .Bsd_2_Clause_Patent:
		return "bsd-2-clause-patent"
	case:
		return "unknown"
	}
}
