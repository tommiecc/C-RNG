function T1(seed::Int, transBuffer)
    # Compute the values for the transform
    collatzOfSeed = CollatzFunction(seed)
    # If the output of the Collatz Function is 1, then the recursion finishes
    if collatzOfSeed == 1
        return transBuffer
    end
    hammingOfSeed = HammingWeight(seed)
    hammingOfCollatz = HammingWeight(collatzOfSeed)
    xorOutput = XORFunction(hammingOfCollatz, hammingOfSeed)
    # Add these values to the buffer
    transBuffer = transBuffer << ndigits(xorOutput, base=2) | xorOutput
    T1(collatzOfSeed, transBuffer)
end

function Tn(seed::Int, prevBuffer)
    xorOutputBuffer = XORFunction(seed, prevBuffer)
    newSeed = seed + xorOutputBuffer
    return T1(newSeed, 0b0)
end

function CollatzFunction(n::Int) 
    if mod(n, 2) == 0
        return div(n, 2)
    else
        return 3 * n + 1
    end
end

function HammingWeight(n::Int)
    count::Int = 0
    while n != 0
        count += 1
        n &= n - 1
    end
    return count
end

function XORFunction(a::Int, b::Int)
    return a ⊻ b
end

