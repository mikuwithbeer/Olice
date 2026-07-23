![Logo](.github/assets/logo.svg)

---

# Olice

![Linux](https://img.shields.io/badge/platform-Linux-red.svg)
![macOS](https://img.shields.io/badge/platform-macOS-green.svg)
![Windows](https://img.shields.io/badge/platform-Windows-blue.svg)

**Olice** is a tiny command-line tool that generates open-source licenses for your projects so you don't have to keep copying them from the internet.

## Picking a License

Figuring out which license to use usually sucks. Olice makes it easier by prioritizing the permissive licenses recommended by the **Blue Oak Council**[^1]. We also include well-known licenses such as **GNU**[^2] and **EUPL**[^3].

If a license has a rating (*model*, *gold*, *silver*, *bronze*, or *lead*), Olice will display it right next to the name so you know exactly what you're getting into.

## Installation

Download the latest prebuilt binary for your platform from the [releases page](https://github.com/mikuwithbeer/Olice/releases/latest).

Alternatively, build it from source.

## Building From Source

### Prerequisites

To compile from source, make sure your environment meets the following requirements:

- [`Odin`](https://odin-lang.org) (programming language)
- `make` (build tool)

### Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/mikuwithbeer/Olice.git
   cd Olice
   ```

2. Compile the project:

   ```bash
   make release
   ```

The compiled binary will be available in the `build/` directory.

## Usage

Generate a license by specifying its identifier. By default, Olice creates a `LICENSE` file in your current working directory.

Run `Olice --help` or `Olice -h` to view the full help menu.

```bash
# List available license identifiers
Olice --list

# Generate a license in the current directory
Olice -i Apache-2.0

# Generate a license with copyright information
Olice -i MIT --name "Jane Doe" --year "2025-2026"

# Generate a license and write it to a custom file
Olice -i BlueOak-1.0.0 -f LICENSE.md

# Print the license directly to the terminal without saving a file
Olice -i 0BSD --stdout
```

## Appendix

This project is licensed under the **Blue Oak Model License 1.0.0**.

[^1]: The Blue Oak Council ranks permissive licenses for you: <https://blueoakcouncil.org/list>
[^2]: GNU offers a bunch of copyleft licenses: <https://www.gnu.org/licenses/license-list.html>
[^3]: The EUPL is an option designed specifically for European Union laws: <https://interoperable-europe.ec.europa.eu/collection/eupl>
