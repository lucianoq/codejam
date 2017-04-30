#!/usr/bin/env ruby

class String
  def flip
    self[0]=='-' ? '+' : '-'
  end
end

def solve(s, k)
  return 0 if s =~ /^\++$/
  return 'IMPOSSIBLE' if k>s.length

  moves = 0
  (0..(s.length-k)).each do |i|
    next if s[i]=='+'
    k.times { |j| s[i+j] = s[i+j].flip }
    moves += 1
  end
  ((s.length-k+1)...s.length).each do |i|
    return 'IMPOSSIBLE' if s[i]=='-'
  end
  return moves
end

def main
  $stdin.readline.to_i.times do |i|
    s, k = $stdin.readline.strip.split(' ')
    k = k.to_i
    puts "Case ##{i+1}: #{solve(s, k)}"
  end
end

main
