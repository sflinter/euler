#!/usr/bin/env ruby

require 'numerical_set'
require 'int'

ts = NumericalSet.new
ps = NumericalSet.new
hs = NumericalSet.new

(143..100000).each do |i|
  ts << i.t
  ps << i.p
  hs << i.h
end

puts (ts.intersection(ps)).intersection(hs)
