require 'set'

class NumericalSet < Set
  def sum
    _sum = 0
    self.each { |i| _sum += i }
    _sum
  end

  def to_s
    self.to_a.sort.join(", ")
  end
end

