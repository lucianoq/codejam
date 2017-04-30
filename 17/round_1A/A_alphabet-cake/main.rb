#!/usr/bin/env ruby

def solve(r, c, lines)
  lines.each do |l|
    l.size.times do |i|
      next if l[i] != '?'
      l[i] = l[(i+1)...l.size].select { |x| x!='?' }.first || l[0...i].select { |x| x!='?' }.last || '?'
    end
  end

  lines.size.times do |i|
    next unless lines[i].all? { |x| x=='?' }
    lines[i] = lines[(i+1)...lines.size].select { |l| l.all? { |x| x!='?' } }.first || lines[0...i].select { |l| l.all? { |x| x!='?' } }.last
  end

  lines
end

def main
  $stdin.readline.to_i.times do |i|
    r, c = $stdin.readline.strip.split(' ').map(&:to_i)
    lines = []
    r.times do
      lines << $stdin.readline.strip.chars
    end
    result = solve(r, c, lines)
    puts "Case ##{i+1}:"
    r.times do |i|
      puts "#{result[i].join}"
    end
  end
end

main
