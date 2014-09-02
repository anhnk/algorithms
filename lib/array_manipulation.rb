require 'benchmark'

small_array = []
10000.times { small_array << 1 }

big_array = []
9000000.times { big_array << 1 }

Benchmark.bm do |bm|
	bm.report do
		small_array.insert 999, 0
	end

	bm.report do
		big_array.insert 999, 0
	end
end

Benchmark.bm do |bm|
	bm.report do
		small_array.push 0
	end

	bm.report do
		big_array.push 0
	end
end

Benchmark.bm do |bm|
	bm.report do
		small_array.pop
	end

	bm.report do
		big_array.pop
	end
end