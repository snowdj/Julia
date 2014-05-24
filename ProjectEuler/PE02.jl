function main()
    i = 1
    j = 1
    tot = 0
    while j <= 4000000
        next = i + j
        i = j
        j = next
        if mod(j, 2) == 0
            tot += j
        end
    end
    println(tot)
end

println(@elapsed main())
