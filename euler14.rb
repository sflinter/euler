#!/usr/bin/env ruby

class Integer
  def next_collatz
    return self/2 if self.even?
    3 * self + 1
  end

  def collatz_length
    return 1 + self.next_collatz.collatz_length if self > 1
    1
  end
end

puts 13.collatz_length
puts 999_999.collatz_length

start = 0
length = 1
(2..999_999).each do |i|
  puts "Trying #{i}.  Best so far: #{start}/#{length}" if 0 == i%10_000
  l = i.collatz_length
  if l > length
    start = i
    length = l
  end
end

puts "term #{start} of length #{length}"
