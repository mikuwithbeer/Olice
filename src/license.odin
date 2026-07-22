package main

import "core:strings"

License_Error :: enum {
	None,
	Failed_To_Lower,
	Unknown_License,
}

License_Kind :: enum {
	BlueOak_1_0_0,
	Bsd_2_Clause_Patent,
	Apache_2_0,
	Bsd_1_Clause,
	Bsd_2_Clause,
	Boost_1_0,
	Educational_Community_1_0,
	Educational_Community_2_0,
	ISC_License,
	MIT_License,
	Universal_Permissive_1_0,
}

License_Rate :: enum {
	Model,
	Gold,
	Silver,
	Bronze,
	Lead,
}

License :: struct {
	kind: License_Kind,
	rate: License_Rate,
	name: string,
	text: string,
}

LICENSES :: [?]License {
	License {
		kind = .BlueOak_1_0_0,
		rate = .Model,
		name = "Blue Oak Model License 1.0.0",
		text = #load("../text/BLUEOAK-1.0.0"),
	},
	License {
		kind = .Bsd_2_Clause_Patent,
		rate = .Gold,
		name = "BSD-2-Clause Plus Patent License",
		text = #load("../text/BSD-2-CLAUSE-PATENT"),
	},
	License {
		kind = .Apache_2_0,
		rate = .Silver,
		name = "Apache License 2.0",
		text = #load("../text/APACHE-2.0"),
	},
	License {
		kind = .Bsd_1_Clause,
		rate = .Silver,
		name = "BSD 1-Clause License",
		text = #load("../text/BSD-1-CLAUSE"),
	},
	License {
		kind = .Bsd_2_Clause,
		rate = .Silver,
		name = "BSD 2-Clause \"Simplified\" License",
		text = #load("../text/BSD-2-CLAUSE"),
	},
	License {
		kind = .Boost_1_0,
		rate = .Silver,
		name = "Boost Software License 1.0",
		text = #load("../text/BSL-1.0"),
	},
	License {
		kind = .Educational_Community_1_0,
		rate = .Silver,
		name = "Educational Community License v1.0",
		text = #load("../text/ECL-1.0"),
	},
	License {
		kind = .Educational_Community_2_0,
		rate = .Silver,
		name = "Educational Community License v2.0",
		text = #load("../text/ECL-2.0"),
	},
	License {
		kind = .ISC_License,
		rate = .Silver,
		name = "ISC License",
		text = #load("../text/ISC"),
	},
	License {
		kind = .MIT_License,
		rate = .Silver,
		name = "MIT License",
		text = #load("../text/MIT"),
	},
	License {
		kind = .Universal_Permissive_1_0,
		rate = .Silver,
		name = "Universal Permissive License v1.0",
		text = #load("../text/UPL-1.0"),
	},
}

@(require_results)
encode_license_kind :: proc(kind: License_Kind) -> string {
	switch kind {
	case .BlueOak_1_0_0:
		return "blueoak-1.0.0"
	case .Bsd_2_Clause_Patent:
		return "bsd-2-clause-patent"
	case .Apache_2_0:
		return "apache-2.0"
	case .Bsd_1_Clause:
		return "bsd-1-clause"
	case .Bsd_2_Clause:
		return "bsd-2-clause"
	case .Boost_1_0:
		return "bsl-1.0"
	case .Educational_Community_1_0:
		return "ecl-1.0"
	case .Educational_Community_2_0:
		return "ecl-2.0"
	case .ISC_License:
		return "isc"
	case .MIT_License:
		return "mit"
	case .Universal_Permissive_1_0:
		return "upl-1.0"
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
	case "apache-2.0":
		return .Apache_2_0, .None
	case "bsd-1-clause":
		return .Bsd_1_Clause, .None
	case "bsd-2-clause":
		return .Bsd_2_Clause, .None
	case "bsl-1.0":
		return .Boost_1_0, .None
	case "ecl-1.0":
		return .Educational_Community_1_0, .None
	case "ecl-2.0":
		return .Educational_Community_2_0, .None
	case "isc":
		return .ISC_License, .None
	case "mit":
		return .MIT_License, .None
	case "upl-1.0":
		return .Universal_Permissive_1_0, .None
	case:
		return {}, .Unknown_License
	}
}

@(require_results)
encode_license_rate :: proc(rate: License_Rate) -> string {
	switch rate {
	case .Model:
		return "model"
	case .Gold:
		return "gold"
	case .Silver:
		return "silver"
	case .Bronze:
		return "bronze"
	case .Lead:
		return "lead"
	case:
		return "unknown"
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
