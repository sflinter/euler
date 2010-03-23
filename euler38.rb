#!/usr/bin/env ruby

# Take the number 192 and multiply it by each of 1, 2, and 3:

#    192 × 1 = 192
#    192 × 2 = 384
#    192 × 3 = 576

# By concatenating each product we get the 1 to 9 pandigital,
# 192384576. We will call 192384576 the concatenated product of 192
# and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2,
# 3, 4, and 5, giving the pandigital, 918273645, which is the
# concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be
# formed as the concatenated product of an integer with (1,2, ... , n)
# where n > 1?

require 'int'

def concat_prod?(base, i, remstr)
  # puts "remstr: #{remstr}"
  return true if remstr == []

  head = (base * i).integer_digits
  if head == remstr[0..head.length-1]
    # puts "base: #{base}, i: #{i}, head: #{head}"
    concat_prod?(base, i+1, remstr[head.length..-1])
  else
    false
  end
end

def concatenated_product?(nstr)
  # nstr = n.integer_digits
  (1..4).each do |i|
    basestr = nstr[0..i-1]
    base = basestr.join.to_i
    remstr = nstr[i..-1]

    return true if concat_prod?(base, 2, remstr)
  end

  false
end

# puts concatenated_product? 987654321.integer_digits
# puts concatenated_product? 192384576.integer_digits
# puts concatenated_product? 918273645.integer_digits

[9,8,7,6,5,4,3,2,1].permutation(9) do |x|
  if concatenated_product? x
    p x.join.to_i
    break
  end
end

