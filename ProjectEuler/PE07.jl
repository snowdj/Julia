function main(n)
    i = n
    p = primes(i)
    while length(p) < n
        i = i * 10
        p = primes(i)
    end
    println(p[n])
end

println(@elapsed main(10001))
