#!/usr/bin/env ruby

require 'prime'

class Coinjam
  attr_reader :coinjam
  attr_reader :divisors

  def initialize(len, seed)
    @coinjam = '1' + "%0#{len-2}d" % seed.to_s(2) + '1'
    @divisors = []
  end

  def correct?
    (2..10).each do |base|
      div = get_one_div(@coinjam.to_i(base))
      return false if div.nil?
      @divisors << div
    end
    true
  end
end


def get_one_div(n)
  upbound = [Math.sqrt(n).floor, 50].min
  Prime.each(upbound) do |p|
    return p if n % p == 0
  end
  nil
end


def generate(num, len)
  array = []
  (0...2**(len-2)).each do |seed|
    return array if array.size >= num
    c = Coinjam.new(len, seed)
    array << c if c.correct?
  end
  array
end


def main
  $stdin.readline.strip.to_i.times do |i|
    n, j = $stdin.readline.strip.split(' ').map(&:to_i)
    puts "Case ##{i+1}:"
    array = generate(j, n)
    array.each do |c|
      s = c.coinjam + ' '
      c.divisors.each { |v| s += v.to_s + ' ' }
      puts s[0..-2]
    end
  end
end

main