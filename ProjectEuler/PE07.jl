
N=10
println(size(primes(N))[1])
while (size(primes(N))[1])<10000
	N = N*10
	end
primes(N)[10001]

## Updated
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
