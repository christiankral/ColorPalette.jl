__precompile__(true)
"""
# ColorPalette

Available color palettes do alway consist of
- five colors with
- five hues each

The color palette names are:

- `black` Solely black colors for prurely black and white appearance
- `gray` Gray shades
- `purple` Purple colors with no green
- `purple2` Second alternative purple colors with no green
- `hanser` Color palette matching technical book publications of the Hanser Verlag
- `hanser2` Second alternative color palette matching technical book publications of the Hanser Verlag
- `hanser3` Third alternative color palette matching technical book publications of the Hanser Verlag

Each color palette is a 5 x 5 matrix of hex color strings.

Color and gray shade samples are available in the directory `resources/png`

"""
module ColorPalette

    using Printf
    using PyPlot

    include("palettes.jl")
    include("functions.jl")
    include("print.jl")
    include("plot.jl")
end # module ColorPalette
