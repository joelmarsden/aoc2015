using MD5

readInput(f) = readline(f)

function find(f, prefix)
    key = readInput(f)
    i = 1
    while(true)
        startswith(bytes2hex(md5(key*string(i))), prefix) && return i
        i+=1
    end
end

@time @show find("data/04_input.txt", "00000")
@time @show find("data/04_input.txt", "000000")