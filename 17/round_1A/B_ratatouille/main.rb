#!/usr/bin/env ruby

def max_serv(n, p, needed, packages)
  packages.each do |k, v|
    packages[k].sort!
  end

  count_packs_complete = 0
  min_serv = []
  max_serv = []
  packages.each do |k, _|
    min_serv << (packages[k][0]*0.9/needed[k]).floor
    max_serv << (packages[k][p-1]*1.1/needed[k]).ceil
  end
  min_serv = min_serv.min
  max_serv = max_serv.max

  (min_serv..max_serv).each do |servs|
    idxs = find_set_packs(n, needed, packages, servs)
    next unless idxs

    idxs.each_with_index { |idx, i| packages[i].delete_at(idx) }
    count_packs_complete += 1
    redo
  end

  count_packs_complete
end

def find_set_packs(n, needed, packages, servs)
  idxs = []
  n.times do |i|
    idx = packages[i].index { |x| x>=servs*needed[i]*0.9 and x<=servs*needed[i]*1.1 }
    return false if idx.nil?
    idxs << idx
  end
  idxs
end

def main
  $stdin.readline.to_i.times do |i|
    n, p = $stdin.readline.strip.split(' ').map(&:to_i)

    needed = $stdin.readline.strip.split(' ').map(&:to_i)

    packages = {}
    n.times do |i|
      packages[i] = $stdin.readline.strip.split(' ').map(&:to_i)
    end
    k = k.to_i
    puts "Case ##{i+1}: #{max_serv(n, p, needed, packages)}"
  end
end

main
