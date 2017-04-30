#!/usr/bin/env ruby

def sheep(n)
  return 'INSOMNIA' if n==0
  i = 0
  arr = Array.new(10, 0)
  until arr.all? { |x| x!=0 } do
    i += 1
    num = n * i
    num.to_s.split('').map(&:to_i).each { |x| arr[x]+=1 }
  end
  num
end

def main
  $stdin.readline.strip.to_i.times do |i|
    n = $stdin.readline.strip.to_i
    puts "Case ##{i+1}: #{sheep n}"
  end
end

main