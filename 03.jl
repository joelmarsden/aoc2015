readInput(f) = readline(f)

function part1(f)
    visited = Dict()
    x = 0 ; y = 0
    for d in readInput(f)
        d == '^' && (y+=1)
        d == 'v' && (y-=1)
        d == '>' && (x+=1)
        d == '<' && (x-=1)
        visited[(x,y)] = true
    end
    length(visited)
end

function part2(f)
    visited = Dict()
    x = 0 ; y = 0 ; xr = 0; yr = 0
    for (i,d) in enumerate(readInput(f))
        d == '^' && (i%2 == 0 ? y+=1 : yr+=1)
        d == 'v' && (i%2 == 0 ? y-=1 : yr-=1)
        d == '>' && (i%2 == 0 ? x+=1 : xr+=1)
        d == '<' && (i%2 == 0 ? x-=1 : xr-=1)
        i%2 == 0 ? visited[(x,y)] = true : visited[(xr,yr)] = true
    end
    length(visited)
end

@time @show part1("data/03_input.txt")
@time @show part2("data/03_input.txt")