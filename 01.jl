readInput(f) = readline(f)

function part1(f)
    input = readInput(f)
    length(findall(x->x=='(', input)) - length(findall(x->x==')', input))
end

function part2(f)
    l = 0
    for (i,c) in enumerate(readInput(f))
        l += (c == '(' ? 1 : -1)
        l == -1 && (return i)
    end
end

@time @show part1("data/01_input.txt")
@time @show part2("data/01_input.txt")