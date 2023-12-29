using IterTools

readInput(f) = readlines(f)

function isNicePart1(line)
    vowels = ['a','e','i','o','u']
    notAllowed = ["ab", "cd", "pq", "xy"]

    vowelCount = 0
    hasTwiceInRow = false
    naughty = false
    for (i,p) in enumerate(line)
        p in vowels && (vowelCount += 1)
        i < length(line) && p == line[i+1] && (hasTwiceInRow = true)
        i < length(line) && p*line[i+1] in notAllowed && (naughty = true)
    end
    vowelCount >= 3 && hasTwiceInRow && !naughty
end

function isNicePart2(line)
    hasPair = false
    for(x,y) in partition(line,2,1)
        length(findall(x*y, line)) >= 2 && (hasPair = true)
    end
    hasRepeat = false
    for (x,_,z) in partition(line,3,1)
        x == z && (hasRepeat = true)
    end
    hasPair && hasRepeat
end

part1(f) = sum(1 for line in readInput(f) if isNicePart1(line))
part2(f) = sum(1 for line in readInput(f) if isNicePart2(line))

@time @show part1("data/05_input.txt")
@time @show part2("data/05_input.txt")