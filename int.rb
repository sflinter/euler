require 'numerical_set'

class Integer
  def primes
    self.primes3
  end

  def primes1
    primes = [nil, nil].concat((2..self).to_a)

    (2 .. Math.sqrt(self).floor).each do |i|
      next unless primes[i]
      (i*i).step(self, i) do |j|
	primes[j] = nil
      end
    end
    
    primes.compact!
  end  

  def primes2
    sieve = []
    3.step(self, 2) { |i| sieve[i] = i }
    sieve[1] = nil
    sieve[2] = 2

    3.step(Math.sqrt(self).floor, 2) do |i| 
      next unless sieve[i]
      (i*i).step(self, i) do |j|
	sieve[j] = nil
      end
    end

    sieve.compact!
  end 

  def primes3

    n2 = 0
    i = 0
    sieve = []

    while n2 < self
      n1 = 6*i+1       # cf. http://betterexplained.com/articles/another-look-at-prime-numbers/ and
      n2 = n1+4        # http://everything2.com/index.pl?node_id=1176369
      i += 1

      sieve[n1] = n1
      sieve[n2] = n2
    end  

    sieve[1] = nil
    sieve[2] = 2
    sieve[3] = 3
    sieve[-1] = nil

    5.step(Math.sqrt(self).floor, 2) do |i| 
      next unless sieve[i]
      (i*i).step(self, i) do |j|     
	sieve[j] = nil
      end
    end   

    sieve.compact!
  end 

  def prime?
    n = self.abs()
    return true if n == 2
    return false if n == 1 || n & 1 == 0

    # cf. http://betterexplained.com/articles/another-look-at-prime-numbers/ and
    # http://everything2.com/index.pl?node_id=1176369

    return false if n > 3 && n % 6 != 1 && n % 6 != 5     # added

    d = n-1
    d >>= 1 while d & 1 == 0
    20.times do                               # 20 = k from above
      a = rand(n-2) + 1
      t = d
      y = ModMath.pow(a,t,n)                  # implemented below
      while t != n-1 && y != 1 && y != n-1
	y = (y * y) % n
	t <<= 1
      end
      return false if y != n-1 && t & 1 == 0
    end
    return true
  end

  def reverse
    self.to_s.reverse.to_i
  end

  def prime_pandigital?
    self.pandigital? && self.prime?
  end

  def pandigital?
    digits = %w( "1" "2" "3" "4" "5" "6" "7" "8" "9" )
    s = self.to_s
    digits[0...s.length].each { |i| return false if s.count(i) != 1 }
    true
  end

  def factorial
    return 1 if self.zero?
    self * (self-1).factorial
  end

  def c(r)
    self.factorial / (r.factorial * (self - r).factorial)
  end

  def t
    (self * (self + 1)) / 2
  end

  def p
    self * (3 * self - 1) / 2
  end

  def h
    self * (2 * self - 1)
  end

  def triangle_n
    n = 1
    while self > n.t
      n += 1
    end
    n.t == self ? n : 0
  end

  def divisor?(x)
    self % x == 0
  end

  def divisors
    divs = NumericalSet.new
    (1 .. self/2).each do |i|
      divs << i unless not self.divisor?(i)
    end
    divs
  end

  def amicable
    x = self.divisors.sum
    y = x.divisors.sum
    x != y && self == y ? x : 0
  end

  def perfect?
    self.divisors.sum == self
  end

  def abundant?
    self.divisors.sum > self
  end

  def deficient?
    self.divisors.sum < self
  end

  def non_abundant_set
    non_ab = NumericalSet.new
    (2 .. self).each do |i|
      non_ab << i unless i.abundant?
    end
    non_ab
  end

  def abundant_set
    ab_set = NumericalSet.new
    (2 .. self).each do |i|
      ab_set << i if i.abundant?
    end
    ab_set
  end

  def abundant_sum?(ab_set)
    found = false
    ab_set.each do |i|
      if ab_set.include? self - i
	found = true
	break
      end
    end
    found
  end

  def non_ab_sums
    abundants = (self+1/2).abundant_set
    puts abundants
    nabs = NumericalSet.new
    (1 .. self).each { |i| nabs << i unless i.abundant_sum?(abundants) }
    nabs
  end

  def number_of_divisors
    k = 1
    num = 0
    until k*k >= self do
      num += 2 if self % k == 0
      k += 1
    end

    num
  end

  # return an array of the component digits for an integer
  def integer_digits
    digits = []
    self.to_s.each_char { |d| digits << d.to_i }
    digits
  end
end

module ModMath
  def ModMath.pow(base, power, mod)
    result = 1
    while power > 0
      result = (result * base) % mod if power & 1 == 1
      base = (base * base) % mod
      power >>= 1;
    end
    result
  end
end
