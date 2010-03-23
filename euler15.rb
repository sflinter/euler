#!/usr/bin/env ruby

# Starting in the top left corner of a 2×2 grid, there are 6 routes
# (without backtracking) to the bottom right corner.

# How many routes are there through a 20×20 grid?

a = Array.new(21).map! { Array.new(21) }
a[0][0] = 0
(1..20).each do |i|
  a[0][i] = 1 # populate the first row
  a[i][0] = 1 # populate the first column
end

(1..20).each do |i|
  (1..20).each { |j| a[i][j] = a[i-1][j] + a[i][j-1] }
end

puts a[20][20]
