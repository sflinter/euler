#!/usr/bin/env ruby

# The sum of the squares of the first ten natural numbers is,
# 1^(2) + 2^(2) + ... + 10^(2) = 385

# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^(2) = 55^(2) = 3025

# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is 3025 - 385 = 2640.

# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.

# http://projecteuler.net/index.php?section=problems&id=6

class Integer
  def square_of_sum
    if self.even?
      ((self + 1)*(self/2)) ** 2
    else
      ((self + 1)*(self/2) + (self/2 + 1)) ** 2
    end
  end

  def sum_of_square
    sum = 0
    (1 .. self).each { |i| sum += i ** 2 }
    sum
  end
end

puts 100.square_of_sum - 100.sum_of_square

