#!/usr/bin/env ruby

#tidy

def tidy(n)
  arr = n.to_s.chars.map(&:to_i)
  until arr.each_cons(2).all? { |p, n| (p <=> n) != 1 }
    (arr.length-1).downto(1) do |i|
      if arr[i-1]>arr[i]
        arr[i-1] -= 1
        (i...arr.length).each{|j| arr[j] = 9 }
      end
    end
  end
  arr.map(&:to_s).join.to_i
end

def main
  $stdin.readline.to_i.times do |i|
    n = $stdin.readline.strip.to_i
    puts "Case ##{i+1}: #{tidy n}"
  end
end


main
