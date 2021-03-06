# require 'benchmark'
#
# # Benchmark.bm 100 do |r|
# #   complete_array = (1..1000).to_a
# #   p target = complete_array.sample
# #   incomplete_array = (1..1000).to_a
# #   incomplete_array.delete(target)
# #
# #   r.report "solution1" do
# #     p complete_array.sum - incomplete_array.sum
# #   end
# #
# #   r.report "solution2" do
# #     result = incomplete_array.each.with_index(1) do |num, index|
# #       break index unless num == index
# #     end
# #     p result
# #   end
# # end
# #
#
# # Benchmark.bm 100 do |r|
# #   array = (1..100000).to_a
# #   r.report "solution3" do
# #     p array.sum
# #   end
# #
# #   r.report "solution4" do
# #     p (array.last + array.first) * array.size / 2
# #   end
# # end
#
# require 'byebug'
# #
# # Benchmark.bm 100 do |r|
# #   p lists = Array.new(100) { rand(100) }
# #   r.report "solution1" do
# #     for i in 1.. lists.size do
# #       min = nil
# #       target_index = 0
# #       lists[(i - 1)..-1].each_with_index do |list, index|
# #         min ||= list
# #         if list < min
# #           min = list
# #           target_index = index
# #         end
# #       end
# #       lists[i - 1], lists[target_index + i - 1] = lists[target_index + i - 1], lists[i - 1]
# #     end
# #     p lists
# #   end
# #
# #   r.report "solution2" do
# #     p lists.sort
# #   end
# # end
# #
# #
# #
# #
#
# #
#  a = gets.to_i
# b, c = gets.chomp.split(' ').map(&:to_i)
#
# answer= a + b + c
# string = gets.chomp
#
#
# puts  "#{answer} #{string}"
#
#
# a, b = gets.chomp.split(' ').map(&:to_i)
# if (a * b).odd?
#   puts "Odd"
# elsif (a * b).even?
#   puts "Even"
# end
#
# n = 0
# nums = gets.chomp.split(' ').map(&:to_i)
#
# def half(nums)
#   nums.map { |num| num / 2 }
# end
#
# while nums.all?(&:even?) do
#   n += 1
#   nums = half(nums)
# end
# #
# # p n
#
# require 'minruby'
#
# pp (minruby_parse("(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)"))
#
# def add
#   p 'addtion!!'
# end
#
# str = gets
# tree = minruby_parse(str)
#
#
# # " O(1)"
def func1(numbers)
  return  numbers[0]
end


def func2(n)
  if n <= 1
    return
  else
    p n
    func2(n / 2)
  end
end

def func3(numbers)
  numbers.each do |number|
    p number
  end
end

def func4(numbers)
  numbers.each do |number|
    numbers.each do |num|
      p number, num
    end
  end
end

require 'benchmark'
# Benchmark.bm 100 do |r|
#   r.report "Olog(n)" do
#     func2(10)
#   end
#
#   r.report "O(n)" do
#     func3((1..10).to_a)
#   end
#
#   r.report "O(n*2)" do
#     func4([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
#   end
# end

# ボゴソート

require 'byebug'
def bogo_sort(numbers)
  while not in_order(numbers)
    numbers.shuffle!
  end
  p numbers
end

def in_order(numbers)
  for i in 0..numbers.size - 2 do
    return false if numbers[i] > numbers[i + 1]
  end
  true
end

def bubble_sort(numbers)
  limits = (0..numbers.size - 2).to_a
  limits.each do |limit|
    for i in 0..(limits.size - 1 - limit) do
      if numbers[i] > numbers[i + 1]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
      end
    end
  end
  p numbers
end

Benchmark.bm 100 do |r|
  r.report 'bogo_sort' do
    bogo_sort([1, 5, 3, 8, 7, 4, 2, 20, 17, 14])
  end

  r.report 'bubble_sort' do
    bubble_sort([1, 5, 3, 8, 7, 4, 2, 20, 17, 14])
  end
end


# Benchmark.bm 100 do |r|
#   r.report 'bogo_sort' do
#     bogo_sort(Array.new(10) { rand(10)})
#   end
# end














