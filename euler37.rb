#!/usr/bin/env ruby

# The number 3797 has an interesting property. Being prime itself, it
# is possible to continuously remove digits from left to right, and
# remain prime at each stage: 3797, 797, 97, and 7. Similarly we can
# work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable
# from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'int'

class Integer
  def prime_truncatable?
    return false if self < 10
    self.prime? && self.to_s.right_pt? && self.to_s.left_pt?
  end
end

class String
  def left_pt?
    #puts self
    return self.to_i.prime? if 1 == self.length
    return self[1..-1].left_pt? if self[1..-1].to_i.prime?
    false
  end

  def right_pt?
    #puts self
    return self.to_i.prime? if 1 == self.length
    return self.chop.right_pt? if self.chop.to_i.prime?
    false
  end
end

puts 3797.prime_truncatable?

primes = 1_000_000.primes
puts "size: #{primes.size}"
c, sum = 0, 0
primes.each do |i|
  break if c >= 11
  if i.prime_truncatable?
    sum += i
    c += 1
    puts "Found # #{c}: #{i}"
  end
end

puts sum
