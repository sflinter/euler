#!/usr/bin/env ruby

# Let d(n) be defined as the sum of proper divisors of n (numbers less
# than n which divide evenly into n).

# If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable
# pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
# 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of
# 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

require 'int'

puts 220.amicable
puts 6.amicable

sum = 0
(6..9_999).each do |i|
  a = i.amicable
  if a != 0
    puts "Found amicable pair: #{a} #{i}"
    sum += a + i
  end
end

puts sum/2
