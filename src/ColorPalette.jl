__precompile__(true)
module ColorPalette

    using Printf
    using PyPlot
    
    include("conversion.jl")
    include("palettes.jl")
    include("plot.jl")
end # module ColorPalette
