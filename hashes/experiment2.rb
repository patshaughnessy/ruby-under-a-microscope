ITERATIONS = 10000

(0..99).each do |size|

  puts "Creating #{ITERATIONS} hashes with #{size} elements."
  hashes = []
  ITERATIONS.times do
    hash = {}
    (1..size).each do |x|
      hash[rand] = rand
    end
    hashes << hash
  end

  require 'benchmark'

  GC.start

  Benchmark.bm do |bench|
    bench.report("adding element number #{size+1}") do
      ITERATIONS.times do |n|
        hashes[n][size] = rand
      end
    end
  end

end
