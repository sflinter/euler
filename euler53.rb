#!/usr/bin/env ruby

require 'int'

count = 0
(1..100).each do |n|
  (1..100).each do |r|
    next if r > n
    count += 1 if n.c(r) > 1_000_000
  end
end

puts count
