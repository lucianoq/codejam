require 'prime'
require 'set'

def solve(n, values)
    all_divs = Set[]
    quotients = {}

    values.each do |val|
        divs = Prime.prime_division(val).map {|x| x[0]}
        all_divs.merge(divs)
        quotients[val] = divs
    end
    raise "bad divs" if all_divs.to_a.length != 26

    k = all_divs.to_a.sort
    v = ('A'..'Z').to_a
    alphabet = Hash[k.zip(v)]

    str = ""
    (values.length-1).times do |i|
        a, b = values[i], values[i+1] 
        a0, a1 = quotients[a]
        b0, b1 = quotients[b]
        if a0 == b0
            quotients[a][0], quotients[a][1] = quotients[a][1], quotients[a][0] 
        elsif a1 == b1
            quotients[b][0], quotients[b][1] = quotients[b][1], quotients[b][0]
        elsif a0 == b1
            quotients[a][0], quotients[a][1] = quotients[a][1], quotients[a][0] 
            quotients[b][0], quotients[b][1] = quotients[b][1], quotients[b][0]
        end
        str += alphabet[quotients[a][0]]
    end
    str += alphabet[quotients[values.last][0]]
    str += alphabet[quotients[values.last][1]]
    return str
end


def main
    $stdin.readline.to_i.times do |i|
        n, l = $stdin.readline.split.map(&:to_i)
        values = $stdin.readline.split.map(&:to_i)
        result = solve(n, values)

        puts "Case ##{i+1}: #{result}"
    end
end

main