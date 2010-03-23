#!/usr/bin/env ruby

# If the numbers 1 to 5 are written out in words: one, two, three,
# four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
# total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were
# written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three
# hundred and forty-two) contains 23 letters and 115 (one hundred and
# fifteen) contains 20 letters. The use of "and" when writing out
# numbers is in compliance with British usage.

class Euler17
  def initialize
    @letters = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety',
      100 => 'hundred',
      1000 => 'thousand',
      :and => 'and'}
    
    @letters = @letters.each { |k,v| @letters[k] = v.length } # replace with length
  end

  def one_to_n(n)
    (1..n).inject(0) { |c,i| c + @letters[i] }
  end

  def solve
    nine = one_to_n(9)
    ninetynine = one_to_n(19)
    ninetynine += ([20,30,40,50,60,70,80,90].inject(0) { |c,i| c + @letters[i] }) * 10
    ninetynine += 8 * nine      # this is the first ninety-nine words
    thousand = ninetynine * 10
    thousand += (@letters[100] + @letters[:and]) * 900
    thousand -= @letters[:and] * 9 # and's are over counted 9 times in the previous line
    thousand += nine * 100
    thousand += @letters[1] + @letters[1000]
  end
end

euler17 = Euler17.new
puts euler17.solve
