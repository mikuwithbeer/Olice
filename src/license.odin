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
	Bsd_0_Clause,
	Bsd_3_Clause,
	Bsd_3_Clause_Clear,
	Bsd_4_Clause,
	Creative_Commons_Zero_1_0,
	MIT_No_Attribution,
	Unlicense,
	Zlib_License,
	SQLite_Blessing,
	Fair_License,
	Good_Luck_With_That,
	Do_WTF_You_Want_To,
	GNU_Affero_General_3_0,
	GNU_General_Public_3_0,
	GNU_General_Public_2_0,
	GNU_Lesser_General_3_0,
	Mozilla_Public_2_0,
	European_Union_Public_1_2,
	Eclipse_Public_1_0,
	Eclipse_Public_2_0,
}

License_Rate :: enum {
	Model,
	Gold,
	Silver,
	Bronze,
	Lead,
	Unknown,
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
	License {
		kind = .Bsd_0_Clause,
		rate = .Bronze,
		name = "BSD Zero Clause License",
		text = #load("../text/BSD-0-CLAUSE"),
	},
	License {
		kind = .Bsd_3_Clause,
		rate = .Bronze,
		name = "BSD 3-Clause \"New\" or \"Revised\" License",
		text = #load("../text/BSD-3-CLAUSE"),
	},
	License {
		kind = .Bsd_3_Clause_Clear,
		rate = .Bronze,
		name = "BSD 3-Clause Clear License",
		text = #load("../text/BSD-3-CLAUSE-CLEAR"),
	},
	License {
		kind = .Bsd_4_Clause,
		rate = .Bronze,
		name = "BSD 4-Clause \"Original\" or \"Old\" License",
		text = #load("../text/BSD-4-CLAUSE"),
	},
	License {
		kind = .Creative_Commons_Zero_1_0,
		rate = .Bronze,
		name = "Creative Commons Zero v1.0 Universal",
		text = #load("../text/CC0-1.0"),
	},
	License {
		kind = .MIT_No_Attribution,
		rate = .Bronze,
		name = "MIT No Attribution",
		text = #load("../text/MIT-0"),
	},
	License {
		kind = .Unlicense,
		rate = .Bronze,
		name = "The Unlicense",
		text = #load("../text/UNLICENSE"),
	},
	License {
		kind = .Zlib_License,
		rate = .Bronze,
		name = "zlib License",
		text = #load("../text/ZLIB"),
	},
	License {
		kind = .SQLite_Blessing,
		rate = .Lead,
		name = "SQLite Blessing",
		text = #load("../text/BLESSING"),
	},
	License {
		kind = .Fair_License,
		rate = .Lead,
		name = "Fair License",
		text = #load("../text/FAIR"),
	},
	License {
		kind = .Good_Luck_With_That,
		rate = .Lead,
		name = "Good Luck With That Public License",
		text = #load("../text/GLWTPL"),
	},
	License {
		kind = .Do_WTF_You_Want_To,
		rate = .Lead,
		name = "Do What The F*ck You Want To Public License",
		text = #load("../text/WTFPL"),
	},
	License {
		kind = .GNU_Affero_General_3_0,
		rate = .Unknown,
		name = "GNU Affero General Public License v3.0",
		text = #load("../text/AGPL-3.0"),
	},
	License {
		kind = .GNU_General_Public_3_0,
		rate = .Unknown,
		name = "GNU General Public License v3.0",
		text = #load("../text/GPL-3.0"),
	},
	License {
		kind = .GNU_General_Public_2_0,
		rate = .Unknown,
		name = "GNU General Public License v2.0",
		text = #load("../text/GPL-2.0"),
	},
	License {
		kind = .GNU_Lesser_General_3_0,
		rate = .Unknown,
		name = "GNU Lesser General Public License v3.0",
		text = #load("../text/LGPL-3.0"),
	},
	License {
		kind = .Mozilla_Public_2_0,
		rate = .Unknown,
		name = "Mozilla Public License 2.0",
		text = #load("../text/MPL-2.0"),
	},
	License {
		kind = .European_Union_Public_1_2,
		rate = .Unknown,
		name = "European Union Public License 1.2",
		text = #load("../text/EUPL-1.2"),
	},
	License {
		kind = .Eclipse_Public_1_0,
		rate = .Unknown,
		name = "Eclipse Public License 1.0",
		text = #load("../text/EPL-1.0"),
	},
	License {
		kind = .Eclipse_Public_2_0,
		rate = .Unknown,
		name = "Eclipse Public License 2.0",
		text = #load("../text/EPL-2.0"),
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
	case .Bsd_0_Clause:
		return "0bsd"
	case .Bsd_3_Clause:
		return "bsd-3-clause"
	case .Bsd_3_Clause_Clear:
		return "bsd-3-clause-clear"
	case .Bsd_4_Clause:
		return "bsd-4-clause"
	case .Creative_Commons_Zero_1_0:
		return "cc0-1.0"
	case .MIT_No_Attribution:
		return "mit-0"
	case .Unlicense:
		return "unlicense"
	case .Zlib_License:
		return "zlib"
	case .SQLite_Blessing:
		return "blessing"
	case .Fair_License:
		return "fair"
	case .Good_Luck_With_That:
		return "glwtpl"
	case .Do_WTF_You_Want_To:
		return "wtfpl"
	case .GNU_Affero_General_3_0:
		return "agpl-3.0"
	case .GNU_General_Public_3_0:
		return "gpl-3.0"
	case .GNU_General_Public_2_0:
		return "gpl-2.0"
	case .GNU_Lesser_General_3_0:
		return "lgpl-3.0"
	case .Mozilla_Public_2_0:
		return "mpl-2.0"
	case .European_Union_Public_1_2:
		return "eupl-1.2"
	case .Eclipse_Public_1_0:
		return "epl-1.0"
	case .Eclipse_Public_2_0:
		return "epl-2.0"
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
	case "bsd-0-clause", "0bsd":
		return .Bsd_0_Clause, .None
	case "bsd-3-clause":
		return .Bsd_3_Clause, .None
	case "bsd-3-clause-clear":
		return .Bsd_3_Clause_Clear, .None
	case "bsd-4-clause":
		return .Bsd_4_Clause, .None
	case "cc0-1.0":
		return .Creative_Commons_Zero_1_0, .None
	case "mit-no-attribution", "mit-0":
		return .MIT_No_Attribution, .None
	case "unlicense":
		return .Unlicense, .None
	case "zlib":
		return .Zlib_License, .None
	case "blessing":
		return .SQLite_Blessing, .None
	case "fair":
		return .Fair_License, .None
	case "glwtpl":
		return .Good_Luck_With_That, .None
	case "wtfpl":
		return .Do_WTF_You_Want_To, .None
	case "agpl-3.0":
		return .GNU_Affero_General_3_0, .None
	case "gpl-3.0":
		return .GNU_General_Public_3_0, .None
	case "gpl-2.0":
		return .GNU_General_Public_2_0, .None
	case "lgpl-3.0":
		return .GNU_Lesser_General_3_0, .None
	case "mpl-2.0":
		return .Mozilla_Public_2_0, .None
	case "eupl-1.2":
		return .European_Union_Public_1_2, .None
	case "epl-1.0":
		return .Eclipse_Public_1_0, .None
	case "epl-2.0":
		return .Eclipse_Public_2_0, .None
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
	case .Unknown:
		return "unknown"
	case:
		return "none"
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
