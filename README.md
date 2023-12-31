# ColorPalette.jl

Julia pacakge providing different color palettes for scientific publications

# Purpose

Provide different color palettes with the intention to be applied
electrical engineering applications.

Each color palette consists of

- five colors with
- five hues, each.

<img src="https://github.com/christiankral/ColorPalette.jl/blob/main/resources/png/ColorPalette.hanser_color.png?raw=true" width="400"/>

A color palette, e.g. `hanser`, is addressed by `color[c,h]`, where
- `c` is the color index 1 to 5 (from bottom to top)
- `h` is the hue index from 1 to 5 (from left to right)

Typically in electrical engineering, but not necessarely, the color indexes `c` mean:

- `color[1,:]` = color of a voltage (blue)
- `color[2,:]` = color of a current (red)
- `color[3,:]` = color of phase L3 (purple)
- `color[4,:]` = color of phase L2 (green)
- `color[5,:]` = color of phase L1 (yellow)

## Julia

In Julia the package `ColorPalette` can be loaded and a color palette can be seleceted, e.g. by

```julia
using ColorPalette # Needs to be installed first
color = hanser
```

Plots and graphs can then be created by using colors from `color[c,h]`.

The color palette can be easly exchanged by another one, without changing the entire Julia code, as `color` is assigned on a single location. The assignment can even be provided in an external file to be included, so that each plot and graph use the same color assignment.

For compatibility reasons the same color palettes are available in LaTeX and [Ipe](https://ipe.otfried.org/).

## LaTeX

The LaTeX color palettes are stored in the subdirectory `resources/latex`. The color palette to be used is included in LaTex by, e.g.,

```latex
\include{ColorPalette.hanser}
```

For example, in LaTex then color name `color21` represents `color[2,1]`: so this typically red color with the highest hue.

## Ipe

[Ipe](https://ipe.otfried.org/) style files are stored in the subdirectors `resources/ipe`. Linux users may "install" the style by creating a symbolic link into the subdirectory `~/.ipe/styles/` by running the script file `ln.sh`.

In the Ipe editor the color palette can added by hitting `Ctrl+Shift+S` (*Edit* $\triangleright$ *Style sheets*)

![Ipe_ _style_sheets.png](https://github.com/christiankral/ColorPalette.jl/blob/main/resources/doc/Ipe_style_sheets.png?raw=true)

The color palettes of one or more Ipe files can be exchanged by running the script `resources/ipe/cpeipe.sh`. This is very convinent, as Ipe drawings can be created with one color palette. The color palettes can be replaced at a later instance in time by simply running the script file.

# Install

Install in Julia:

```julia
using Pkg
Pkg.add(url = "https://github.com/christiankral/ColorPalette.jl")
```

# Nomenclature

- `color` color hex code, e.g. "#ff0000"
- `gray` gray hex code, e.g. "#555555"
- `RGB` Tuple `(R, G, B)`
    - `R` red with 0 ≤ `R` ≤ 255
    - `G` red with 0 ≤ `G` ≤ 255
    - `B` red with 0 ≤ `B` ≤ 255
- `rgb` Tuple `(r, g, b)`
    - `r` red with 0.0 ≤ `r` ≤ 1.0
    - `g` red with 0.0 ≤ `g` ≤ 1.0
    - `b` red with 0.0 ≤ `b` ≤ 1.0
- `HSV` Tuple `(H, S, V)`
    - `H` red with 0.0 ≤ `H` ≤ 1.0
    - `S` red with 0.0 ≤ `S` ≤ 1.0
    - `V` red with 0 ≤ `V` ≤ 255
