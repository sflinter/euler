#!/usr/bin/env ruby

# A palindromic number reads the same both ways. The largest
# palindrome made from the product of two 2-digit numbers is 9009 = 91
# × 99.

# Find the largest palindrome made from the product of two 3-digit
# numbers.

# http://projecteuler.net/index.php?section=problems&id=4

class Integer
  def palindrome?
    s = self.to_s
    s == s.reverse
  end
end

pals = []
(900.. 999).each do |i|
  (900 .. 999).each do |j|
    poss = i * j
    pals << poss if poss.palindrome?
  end
end

puts pals.max

