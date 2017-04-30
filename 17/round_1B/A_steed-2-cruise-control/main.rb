#!/usr/bin/env ruby

def solve(d, n, kk, ss)
  eta = []
  n.times do |i|
    eta << (d-kk[i]).to_f/ss[i].to_f
  end
  max_eta = eta.max
  d.to_f / max_eta
end

def main
  $stdin.readline.to_i.times do |i|
    d, n = $stdin.readline.strip.split(' ').map(&:to_i)
    kk, ss = [], []
    n.times do
      k, s = $stdin.readline.strip.split(' ').map(&:to_i)
      kk << k
      ss << s
    end

    result = solve(d, n, kk, ss)
    puts "Case ##{i+1}: #{result.round(6)}"
  end
end

main
