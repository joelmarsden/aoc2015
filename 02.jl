readInput(f) = [sort!([parse(Int,i) for i in split(line, "x") if strip(i) != ""]) for line in readlines(f)]

part1(f) = sum(3a*b + 2a*c + 2b*c for (a,b,c) in readInput(f))
part2(f) = sum(min(2a+2b,2a+2c,2b+2c) + prod([a,b,c]) for (a,b,c) in readInput(f))

@time @show part1("data/02_input.txt")
@time @show part2("data/02_input.txt")