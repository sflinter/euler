#!/usr/bin/env ruby

# A common security method used for online banking is to ask the user
# for three random characters from a passcode. For example, if the
# passcode was 531278, they may asked for the 2nd, 3rd, and 5th
# characters; the expected reply would be: 317.

# The text file, keylog.txt, contains fifty successful login attempts.

# Given that the three characters are always asked for in order,
# analyse the file so as to determine the shortest possible secret
# passcode of unknown length.

require 'int'

passwords = %w{ 319 680 180 690 129 620 762 689 762 318 368 710 720 710 629 168 160 689 716 731 736 729 316 729 729 710 769 290 719 680 318 389 162 289 162 718 729 319 790 680 890 362 319 760 316 729 380 319 728 716 }.uniq

digits = []
passwords.each { |p| digits << p.to_i.integer_digits }

def consistent?(result, test)
  indices = test.integer_digits.map { |i| result.index(i) }
  indices == indices.sort
end

answer = 73162890.integer_digits
puts passwords.map { |n| consistent?(answer, n.to_i) }.uniq

