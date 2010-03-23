#!/usr/bin/env ruby

# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime
# below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds
# to a prime, contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the
# most consecutive primes?

require '../ruby/bst'
require 'int'

class Euler50
  def initialize(n)
    @n = n
    @primes = n.primes
  end

  def prime_sum_length(start)
    sum = max_sum = 0
    length = 0
    count = 0
    @primes[@primes.index(start)..@primes.length].each do |i|
      sum += i
      count += 1
      if @primes.include?(sum)
        length = count 
        max_sum = sum
      end
    end
    [max_sum, length]
  end
  
  def max_prime_sum_length
    max = 0
    sum = 0
    @primes.each do |i|
      s,l = prime_sum_length(i)
      if l > max
        max = l
        sum = s
        puts "Max: #{max} starting prime #{i} sum #{sum}"
      end
    end
    max
  end
end

euler50 = Euler50.new(1_000)
#puts euler50.prime_sum_length(2)
puts euler50.max_prime_sum_length
