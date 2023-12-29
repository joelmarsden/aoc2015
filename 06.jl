@enum Instruction begin
    Off=0
    On=1
    Toggle=2
end

function readInput(f)
    input = []
    for line in readlines(f)
        ins = Off
        startswith(line, "turn on ") && (ins=On ; line=line[9:end])
        startswith(line, "turn off ") && (ins=Off ; line=line[10:end])
        startswith(line, "toggle ") && (ins=Toggle ; line=line[8:end])
        (from, to) = split(line, " through ")
        from = [parse(Int, f)+1 for f in split(from, ",")] # Julia 1 based
        to = [parse(Int, t)+1 for t in split(to, ",")]
        push!(input, (ins, from, to))
    end
    input
end

function applyPart1(m, ins, from, to)
    for x in from[1]:to[1]
        for y in from[2]:to[2]
            ins == On && (m[x,y] = true)
            ins == Off && (m[x,y] = false)
            ins == Toggle && (m[x,y] = !m[x,y])
        end
    end
end

function applyPart2(m, ins, from, to)
    for x in from[1]:to[1]
        for y in from[2]:to[2]
            ins == On && (m[x,y] +=1)
            ins == Off && (m[x,y] = max(0, m[x,y]-1))
            ins == Toggle && (m[x,y] +=2)
        end
    end
end

function part1(f)
    m = zeros(Bool, 1000,1000)
    [applyPart1(m, ins, from, to) for (ins, from, to) in readInput(f)]
    sum(m)
end

function part2(f)
    m = zeros(Int, 1000,1000)
    [applyPart2(m, ins, from, to) for (ins, from, to) in readInput(f)]
    sum(m)
end

@time @show part1("data/06_input.txt")
@time @show part2("data/06_input.txt")