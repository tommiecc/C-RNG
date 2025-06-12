@info "Transform.jl Tests"
@testset "transform tests" begin
    @info "CollatzFunction Tests"
    @test CollatzFunction(5) == 16
    @test CollatzFunction(16) == 8 

    @info "HammingWeight Tests"
    @test HammingWeight(43) == 4

    @info "XOR Tests"
    @test XORFunction(3, 1) == 2

    @info "Transform Functions Tests"
    @test T1(4594, 0b0) == 4432212399411439896
    @test Tn(4594, 4432212399411439896) == 4328482820446869528
end