#!/usr/bin/ruby

# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.

# What is the smallest number that is evenly divisible by all of the
# numbers from 1 to 20?

# http://projecteuler.net/index.php?section=problems&id=5

def gcd(a, b)
  if a == b
    a
  elsif a < b
    gcd1(b, a)
  else
    gcd1(a, b)
  end
end

def gcd1(a, b)
  rem = a%b
  if rem > 0
    gcd1(b, rem)
  else
    b
  end
end

def lcm(a, b)
  (a / gcd(a, b)) * b
end

puts gcd(84, 18)
puts lcm(21, 6)

a = 1
(2..20).each do |i|
  a = lcm(a, i)
end
puts a
