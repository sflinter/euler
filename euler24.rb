#!/usr/bin/env ruby

# A permutation is an ordered arrangement of objects. For example,
# 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all
# of the permutations are listed numerically or alphabetically, we
# call it lexicographic order. The lexicographic permutations of 0, 1
# and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1,
# 2, 3, 4, 5, 6, 7, 8 and 9?

# Refer to http://www.fmi.uni-sofia.bg/fmi/statist/Personal/Vandev/papers/albetpap.pdf for some ideas

a = [0, 1, 2]

class Array
  def partition
    j = 0
    (self.length-2).downto(0).each { |i| (j = i ; break) if self[i] > self[i+1] }
    [ self[0..j-1], self[j..-1] ]
  end
end

b = [1, 2, 3, 4]
puts b.partition[0].join(",")
puts b.partition[1].join(",")
#puts b[0..i].join(",")
#puts b[i+1..-1].join(",")
