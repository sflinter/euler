#!/usr/bin/env ruby

# A Pythagorean triplet is a set of three natural numbers, a < b < c,
# for which, a^(2) + b^(2) = c^(2)

# For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).

# There exists exactly one Pythagorean triplet for which a + b + c =
# 1000.  Find the product abc.

def triple(x)
  0 unless x.odd?
  (x ** 2 - 1) / 2
end

# (3..1000).each do |i|
#   next if i.even?
#   x = triple(i)
#   puts "#{i}, #{x}, #{x+1}, #{i + x + x+1}" #if i + x + x+1 == 1000
# end

(1..100).each do |m|
  (1..100).each do |n|
    next unless m > n
    a = 2 * m * n
    b = m**2 - n**2
    c = m**2 + n**2
    #puts "a: #{a} b: #{b} c: #{c} a+b+c = #{a+b+c}"
    puts "PRODUCT: #{a*b*c}" if a+b+c == 1000
  end
end
