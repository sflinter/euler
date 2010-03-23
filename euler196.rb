#!/usr/bin/env ruby

# Build a triangle from all positive integers in the following way:

#  1
#  2  3
#  4  5  6
#  7  8  9 10
# 11 12 13 14 15
# 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# 29 30 31 32 33 34 35 36
# 37 38 39 40 41 42 43 44 45
# 46 47 48 49 50 51 52 53 54 55
# 56 57 58 59 60 61 62 63 64 65 66
# . . .

# Each positive integer has up to eight neighbours in the triangle.

# A set of three primes is called a prime triplet if one of the three
# primes has the other two as neighbours in the triangle.

# For example, in the second row, the prime numbers 2 and 3 are
# elements of some prime triplet.

# If row 8 is considered, it contains two primes which are elements of
# some prime triplet, i.e. 29 and 31.  If row 9 is considered, it
# contains only one prime which is an element of some prime triplet:
# 37.

# Define S(n) as the sum of the primes in row n which are elements of
# any prime triplet.  Then S(8)=60 and S(9)=37.

# You are given that S(10000)=950007619.

# Find  S(5678027) + S(7208785).

require 'int'

#def mda(width, height)
#  Array.new(width).map! { Array.new(height) }
#end

def mda(*dimensions)
  dim = dimensions.shift
  if dimensions.size == 0
    Array.new(dim)
  else
    Array.new(dim).map! { mda(*dimensions) }
  end
end

def primes_in_triangle_row(n)
  width = n.t - (n-1).t + 1
  puts width
  primes = mda(width, 2)
  i = 0
  (((n-1).t + 1) .. n.t).each do |j|
    primes[i][0] = j.prime? ? j : 0
    i += 1
  end
  primes
end

def prime_triples_in_triangle_row(n)
  r1 = primes_in_triangle_row(n-2)
  r2 = primes_in_triangle_row(n-1)
  r3 = primes_in_triangle_row(n)
  r4 = primes_in_triangle_row(n+1)
  r5 = primes_in_triangle_row(n+2)

  sum = 0
  for i in 0..((r2.size)-1) do
    num_primes = 0
    if i > 0 && r2[i] > 1
      puts "Considering #{r2[i]} in row #{n}"
      num_primes = num_non_zeros([r1[i-1], r1[i], r1[i+1], r2[i-1], r2[i+1], r3[i-1], r3[i], r3[i+1]])
    elsif i == 0 && r2[i] > 1
      puts "Considering #{r2[i]} in row #{n}"
      num_primes = num_non_zeros([r1[i], r1[i+1], r2[i+1], r3[i], r3[i+1]])
    end
    sum += r2[i] if num_primes >= 2
  end
  sum
end

def prime_triples(r1, r2, r3)
  for i in 0..((r2[0].size)-1) do
    num_primes = 0
    if i > 0 && r2[i][0] > 1
      puts "Considering #{r2[i][0]} in row #{n}"
      num_primes = num_non_zeros([r1[i-1][0], r1[i][0], r1[i+1][0], r2[i-1][0], r2[i+1][0], r3[i-1][0], r3[i][0], r3[i+1][0]])
    elsif i == 0 && r2[i][0] > 1
      puts "Considering #{r2[i][0]} in row #{n}"
      num_primes = num_non_zeros([r1[i][0], r1[i+1][0], r2[i+1][0], r3[i][0], r3[i+1][0]])
    end
    r2[i][1] = 1  # Mark the number under consideration as a member of a prime triple
    sum += r2[i] if num_primes >= 2
  end
end

def num_non_zeros(array)
  sum = 0
  array.each { |i| sum += 1 if i > 0 }
  sum
end

puts primes_in_triangle_row(8).join(',')

#puts "8: #{prime_triples_in_triangle_row(8)}"
#puts "9: #{prime_triples_in_triangle_row(9)}"
#puts "10,000: #{prime_triples_in_triangle_row(10_000)}"

