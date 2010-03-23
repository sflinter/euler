#!/usr/bin/env ruby

def factorial(n)
  if n == 1
    1
  else
    n * factorial(n-1)
  end
end

sum = 0
factorial(100).to_s.each_char { |c| sum += c.to_i }
puts sum
