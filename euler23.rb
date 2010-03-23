#!/usr/bin/env ruby

# A perfect number is a number for which the sum of its proper
# divisors is exactly equal to the number. For example, the sum of the
# proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means
# that 28 is a perfect number.

# A number whose proper divisors are less than the number is called
# deficient and a number whose proper divisors exceed the number is
# called abundant.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
# smallest number that can be written as the sum of two abundant
# numbers is 24. By mathematical analysis, it can be shown that all
# integers greater than 28123 can be written as the sum of two
# abundant numbers. However, this upper limit cannot be reduced any
# further by analysis even though it is known that the greatest number
# that cannot be expressed as the sum of two abundant numbers is less
# than this limit.

# Find the sum of all the positive integers which cannot be written as
# the sum of two abundant numbers.

# http://projecteuler.net/index.php?section=problems&id=23

require 'numerical_set'

class Integer
  def divisor?(x)
    self % x == 0
  end

  def divisors
    divs = NumericalSet.new
    (1 .. self/2).each do |i|
      divs << i unless not self.divisor?(i)
    end
    divs
  end

  def perfect?
    self.divisors.sum == self
  end

  def abundant?
    self.divisors.sum > self
  end

  def deficient?
    self.divisors.sum < self
  end

  def non_abundant_set
    non_ab = NumericalSet.new
    (2 .. self).each do |i|
      non_ab << i unless i.abundant?
    end
    non_ab
  end

  def abundant_set
    ab_set = NumericalSet.new
    (2 .. self).each do |i|
      ab_set << i if i.abundant?
    end
    ab_set
  end

  def abundant_sum?(ab_set)
    found = false
    ab_set.each do |i|
      if ab_set.include? self - i
	found = true
	break
      end
    end
    found
  end

  def non_ab_sums
    abundants = (self+1/2).abundant_set
    puts abundants
    nabs = NumericalSet.new
    (1 .. self).each { |i| nabs << i unless i.abundant_sum?(abundants) }
    nabs
  end
end


nabs = 28123.non_ab_sums
puts "size: #{nabs.size}"
puts "sum: #{nabs.sum}"


