#!/usr/bin/env ruby


def last_word(s)
  s = s.chars
  last = s.shift
  until s.empty?
    if s[0] < last[0]
      last << s.shift
    else
      last = s.shift + last
    end
  end
  last
end


def main
  $stdin.readline.strip.to_i.times do |i|
    s = $stdin.readline.strip
    puts "Case ##{i+1}: #{last_word s}"
  end
end


main