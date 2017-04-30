#!/usr/bin/env ruby

def solve(s)
  n = 0
  (0...s.size-1).each do |i|
    n += 1 if s[i]!=s[i+1]
  end

  n += 1 if s[-1] == '-'

  n
end


def main
    $stdin.readline.strip.to_i.times do |i|
    s = $stdin.readline.strip
    puts "Case ##{i+1}: #{solve s}"
  end
end

main
