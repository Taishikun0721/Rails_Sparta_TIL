require 'byebug'
require 'benchmark'

def linear_search(numbers, answer)
  result = numbers.each do |number|
    return number if number == answer
  end
  result
end

def binary_search(numbers, answer)
  left, right = 0, numbers.size - 1
  while left <= right
    mid = (left + right) / 2
    result = if numbers[mid] == answer
               return numbers[mid]
             elsif numbers[mid] <= answer
               left = mid + 1
             elsif numbers[mid] > answer
               right = mid - 1
             end
    result
  end
end

def median(numbers)
  numbers.count / 2
end


Benchmark.bm do |r|
  numbers = (1..1000).to_a
  answer = (1..1000).to_a.sample
  r.report "linear search" do
    p linear_search(numbers, answer)
  end

  r.report "binary search" do
    p binary_search(numbers, answer)
  end
end