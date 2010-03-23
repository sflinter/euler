#!/usr/bin/env ruby

require 'benchmark' 
require 'int'

# limit = 10_000_000
# limit = 5_000_000
limit = 1_000_000
# limit = 500_000
# limit = 100_000
# limit = 10_000
# limit = 7_500
# limit = 5_000
# limit = 1_000
# limit = 500_000

ret1 = nil
ret2 = nil
ret3 = nil

# cf. primegen.c, http://cr.yp.to/primegen.html and
# prime_sieve.c, http://wwwhomes.uni-bielefeld.de/achim/prime_sieve.html

Benchmark.bm(14) do |t|       

  t.report("primes up to #{limit}: ") do
    ret1 = limit.primes1
  end 

  t.report("primes up to #{limit}: ") do
    ret2 = limit.primes2
  end 

  t.report("primes up to #{limit}: ") do
    ret3 = limit.primes3
  end 
end 

puts

#p ret1.first(10)
p ret1.last(10)
p ret1.size

puts

#p ret2.first(10)
p ret2.last(10)
p ret2.size

puts 

#p ret3.first(10)
p ret3.last(10)
p ret3.size
