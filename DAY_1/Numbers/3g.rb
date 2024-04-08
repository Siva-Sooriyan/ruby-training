# Compute n! mod p 

def modFact (n,p)
    return 0 if n >= p

    result = 1
    (1..n).each do |i|
        result = (result * i) % p
    end
    return result
end


puts modFact(6,11)