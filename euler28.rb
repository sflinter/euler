#!/usr/bin/env ruby

# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of both diagonals is 101.

# What is the sum of both diagonals in a 1001 by 1001 spiral formed in
# the same way?

class Array2D < Array
  def initialize(i,j)
    super(i).map! { Array.new(j) }
  end
  
  def dimensions
    [self.length, self[0].length]
  end
  
  def transpose
    row,col = self.dimensions
    t = Array2D.new(col, row)
    (0..row-1).each do |i|
      (0..col-1).each do |j|
        t[j][i] = self[i][j]
      end
    end
    t
  end
  
  def rotate90
    row,col = self.dimensions
    t = Array2D.new(col, row)
    (0..row-1).each do |i|
      (0..col-1).each do |j|
        t[col-j][row-i] = self[i][j]
      end
    end
    t
  end
  
  def to_s
    self.map { |row| format_row row }
  end
  
  def format_row(row)
    row.join(' ')
  end
end

class Euler28
  def initialize
    @arr = Array2D(1,1)
    @arr[0][0] = 1
  end
  
  def expand(arr)
    l = arr[0].length
    puts l
    if l.odd?
      arr.map! { |row| }
    end
    arr[0] << 2
    arr << [4,3]
  end
  
  def solve
    expand @arr
    puts @arr
  end
end

a = Array2D.new(2,2)
a[0] = [1,2]
a[1] = [4,3]
puts a.rotate90.to_s

#euler28 = Euler28.new
#euler28.solve
