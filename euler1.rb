#!/usr/bin/env ruby

# Find the sum of all the multiples of 3 or 5 below 1000.

require 'numerical_set'

def multiples_of(n, max)
  multiples = NumericalSet.new
  x = n
  while x < max do
    multiples << x
    x += n
  end
  multiples
end

def find_multiples(max)
  (multiples_of(5, max) | multiples_of(3, max)).sum
end

def main
  max = Integer(ARGV.shift || 1_000)
  puts find_multiples(max)
  rescue:
    puts "Usage: euler1.rb <integer>"
end

main

