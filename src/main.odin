package main

import "core:fmt"
import "core:os"

main :: proc() {
	fmt.println(os.args)
	for license in LICENSES {
		fmt.println(license_name(license.kind))
		fmt.println(license.name)
		fmt.println(license.text)
	}
}
