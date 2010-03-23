#!/usr/bin/env ruby

# We shall say that an n-digit number is pandigital if it makes use of
# all the digits 1 to n exactly once. For example, 2143 is a 4-digit
# pandigital and is also prime.

# What is the largest n-digit pandigital prime that exists?

require 'int'

puts 987654321.primes.size
# i = 987654321
# while i > 0
#   puts "Considering #{i}" if (i % 10_000) == 0
#   break if i.prime_pandigital?
#   i -= 1
# end

# puts i

