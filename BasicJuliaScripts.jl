function rmeans(dist, nobs; nsims = 500)
    means = Array(Float64,nsims)
    for i in 1:nsims
        means[i] = mean(rand(dist, nobs))
    end
    return means
end


%-------------------------------------%

rmeans_pretty(dist, nobs; nsims = 500) =
    [ mean(rand(dist, nobs)) for i = 1:nsims ]
