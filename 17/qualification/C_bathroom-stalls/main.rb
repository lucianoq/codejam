#!/usr/bin/env ruby

def bath(n, k)
  free = Hash.new(0)
  free[n] = 1
  max = n
  j = k
  while j!=0 do
    return 0, 0 if max == 1
    r = max/2
    l = (max-1)/2

    spots = free[max]
    if free[max] < j
      free.delete(max)
      free[r] += spots if r != 0
      free[l] += spots if l != 0
      j -= spots
      max = free.keys.max
    else
      return r, l
    end
  end
end


def main
  $stdin.readline.to_i.times do |i|
    n, k = $stdin.readline.strip.split(' ').map(&:to_i)
    max, min = bath(n, k)
    puts "Case ##{i+1}: #{max} #{min}"
  end
end

main
