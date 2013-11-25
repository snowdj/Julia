
##
using Distributions

function cont_run(burn_in, reps, n, d, l, s)
    tr = Array(Float64, n)
    r = Array(Float64, reps)
    for i in 1:reps
        aris = 0
        sig = randn() * d
        mul = 1
        if sig < 0
            sig = -sig
            mul = -1
        end
        for k in 1:n
            if sig > tr[k]
                aris += 1
            end
        end
        ari = aris / (l * n)
        r[i] = mul * ari
        for j in 1:n
            if rand() < s
                tr[j] = ari
            end
        end
    end
    kurtosis(r[burn_in:reps])
end

n = 10
t_start = time()
k = Array(Float64, n)
for i in 1:n
    k[i] = cont_run(1000, 10000, 1000, 0.005, 10.0, 0.01)
end
println(time() -t_start)
