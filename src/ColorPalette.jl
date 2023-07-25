__precompile__(true)
module ColorPalette

    using Printf
    using PyPlot

    include("palettes.jl")
    include("functions.jl")
    include("print.jl")
    include("plot.jl")
end # module ColorPalette
