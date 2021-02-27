require 'benchmark'

Benchmark.bm 100 do |r|
  complete_array = (1..1000).to_a
  p target = complete_array.sample
  incomplete_array = (1..1000).to_a
  incomplete_array.delete(target)

  r.report "solution1" do
    p complete_array.sum - incomplete_array.sum
  end

  r.report "solution2" do
    result = incomplete_array.each.with_index(1) do |num, index|
      break index unless num == index
    end
    p result
  end
end


# Benchmark.bm 100 do |r|
#   array = (1..100000).to_a
#   r.report "solution3" do
#     p array.sum
#   end
#
#   r.report "solution4" do
#     p (array.last + array.first) * array.size / 2
#   end
# end