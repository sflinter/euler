#!/usr/bin/ruby

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

# http://projecteuler.net/index.php?section=problems&id=3

def fermat_factor(n)
  a = Math.sqrt(n).ceil
  bsq = a**2 - n
  while not square?(bsq)
    # puts "a: #{a} b: #{bsq}"
    a += 1
    bsq = a**2 - n
  end
  b = Math.sqrt(bsq)
  [(a+b).to_i, (a-b).to_i]
end

def square?(n)
  a = Math.sqrt(n)
  a.to_i == a
end

def prime_factors(n)
  pfs = []
  factors = fermat_factor(n)
  #puts "Factors: #{factors[0]}, #{factors[1]}"
  if factors[0] == 1 || factors[1] == 1
    pfs << factors[0]
    pfs << factors[1]
  else
    pfs << prime_factors(factors[0]).uniq
    pfs << prime_factors(factors[1]).uniq
  end
  pfs
end

puts prime_factors(1000009).flatten.uniq.join(", ")
