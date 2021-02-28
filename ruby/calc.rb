require 'benchmark'

# Benchmark.bm 100 do |r|
#   complete_array = (1..1000).to_a
#   p target = complete_array.sample
#   incomplete_array = (1..1000).to_a
#   incomplete_array.delete(target)
#
#   r.report "solution1" do
#     p complete_array.sum - incomplete_array.sum
#   end
#
#   r.report "solution2" do
#     result = incomplete_array.each.with_index(1) do |num, index|
#       break index unless num == index
#     end
#     p result
#   end
# end
#

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

require 'byebug'

Benchmark.bm 100 do |r|
  p lists = Array.new(100) { rand(100) }
  r.report "solution1" do
    for i in 1.. lists.size do
      min = nil
      target_index = 0
      lists[(i - 1)..-1].each_with_index do |list, index|
        min ||= list
        if list < min
          min = list
          target_index = index
        end
      end
      lists[i - 1], lists[target_index + i - 1] = lists[target_index + i - 1], lists[i - 1]
    end
    p lists
  end

  r.report "solution2" do
    p lists.sort
  end
end
















