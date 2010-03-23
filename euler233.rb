#!/usr/bin/env ruby

# Let f(N) be the number of points with integer coordinates that are
# on a circle passing through (0,0), (N,0),(0,N), and (N,N).

# It can be shown that f(10000) = 36.

# What is the sum of all positive integers N ? 10^(11) such that f(N)
# = 420 ?

# http://projecteuler.net/index.php?section=problems&id=233

class Circle
  def initialize(n = 10_000)
    @n = n
    @n_sqr = n**2
    @r = (Math::sqrt(2) * n) / 2
    @r_sqr = Math::sqrt(2) * n
  end

  def hypo(x)
    Math::sqrt((@n_sqr/4 + @n*x - x**2).abs)
  end

  def lattice_point?(x)
    h = hypo x
    #puts "h = #{h} for x: #{x}"
    h.ceil == h
  end

  def lattice_points_bf
    count = 0
    start = (@n/2 - @r).floor.to_i
    (start .. @n/2).each do |i|
      count += 1 if lattice_point?(i)
    end

    count * 4
  end

  def lattice_points
    
  end
end

c = Circle.new(10 ** 11)
puts c.lattice_point?(0)
puts c.lattice_point?(1)
puts c.lattice_point?(5_000)
puts c.lattice_point?(10_000)
puts c.lattice_points
