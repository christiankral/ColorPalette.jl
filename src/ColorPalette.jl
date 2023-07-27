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
- `purple2` Alternative purple colors with no green
- `hanser` Color palette matching technical book publications of the Hanser Verlag
- `hanser2` Alternative color palette matching technical book publications of the Hanser Verlag

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
