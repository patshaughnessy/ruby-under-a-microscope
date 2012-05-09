require 'benchmark'

ITERATIONS = 10000

class KeyObject
  def hash
    4
  end
end

(1..20).each do |exponent|

  size = 2**exponent
  hash = {}
  target_index = 0
  (1..size).each do |n|
    hash_index = KeyObject.new
    hash[hash_index] = rand
    target_index = hash_index if n == size/2
  end

  GC.start

  Benchmark.bm do |bench|
    bench.report("retrieving an element from a hash with #{size} elements #{ITERATIONS} times") do
      ITERATIONS.times do |n|
        val = hash[target_index]
      end
    end
  end

end
