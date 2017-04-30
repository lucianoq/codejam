#!/usr/bin/env ruby

class Pancake
  attr_reader :r
  attr_reader :h
  attr_reader :lsurf
  attr_reader :area
  attr_reader :syrup

  def initialize(r, h)
    @r, @h = r.to_f, h.to_f
    @lsurf = @h * (2*Math::PI*@r)
    @area = @r**2 * Math::PI
    @syrup = @lsurf + @area
  end
end

def area_gain(new, min, last)
  (new.area - last.area) + (new.lsurf - min.lsurf)
end

def solve(k, pp)
  set = (pp.sort_by { |x| -x.lsurf })[0...k].sort_by { |x| -x.r }
  bases = (pp-set).select { |x| x.r>=set[0].r }

  if bases.size != 0
    min_lsurf_stack = set.min_by { |x| x.lsurf }
    max_gain_base = bases.max_by { |x| area_gain(x, min_lsurf_stack, set[0]) }
    if area_gain(max_gain_base, min_lsurf_stack, set[0]) > 0
      set[set.index(min_lsurf_stack)] = max_gain_base
      set = set.sort_by { |x| -x.r }
    end
  end
  area = set[0].area
  lateral = set.map { |x| x.lsurf }.inject(:+)
  area + lateral
end


def main
  $stdin.readline.to_i.times do |i|
    n, k = $stdin.readline.strip.split(' ').map(&:to_i)
    pp = []
    n.times do
      ri, hi = $stdin.readline.strip.split(' ').map(&:to_i)
      pp << Pancake.new(ri, hi)
    end

    result = solve(k, pp)
    puts "Case ##{i+1}: " + '%.9f' % result.round(9)
  end
end

main
