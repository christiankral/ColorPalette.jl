# test/runtests.jl
using ColorPalette, Test

function tests()
    @testset "Subset of tests" begin
        @test (255,0,0) == color2RGB("#ff0000")
        @test "#555555" == color2gray("#ff0000")
        @test (0.0, 1.0, 255) == color2HSV("#ff0000")
    end
end

tests()
