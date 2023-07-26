# test/runtests.jl
using ColorPalette, Test

function tests()
    @testset "Subset of tests" begin
        @test (255,0,0) == color2RGB("#ff0000")
        @test "#555555" == color2gray("#ff0000")
        @test (0.0, 1.0, 255) == color2HSV("#ff0000")
    end
end

function plots()
    plotpalette(color_seasonal, save=true, name="_seasonal")
    plotpalette(color_contrast, save=true, name="contrast")
    plotpalette(color_coolors, save=true, name="_coolors")
    plotpalette(color_purple, save=true, name="_purple")
    plotpalette(color_hanser, save=true, name="_hanser")
    plotpalette(color_hanser2, save=true, name="_hanser2")
end

tests()
