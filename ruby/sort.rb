require 'byebug'
require 'benchmark'

def bubble_sort(numbers)
  limits = (0..numbers.size - 2).to_a
  limits.each do |limit|
    for i in 0..(limits.size - 1 - limit) do
      if numbers[i] > numbers[i + 1]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
      end
    end
  end
  numbers
end

def quick_sort(numbers)
  @result = []
  pivot = numbers.last
  partition(numbers, pivot, -1)
end

def partition(numbers, pivot, pivot_index)
  numbers.each_with_index do |number, index|
    if smaller_than_pivot?(number, pivot)
      pivot_index += 1
      swap(numbers, index, pivot_index)
    end
  end
  if sort?(numbers)
    @result.concat(numbers)
  else
    partition(numbers[0..pivot_index - 1], numbers[0..pivot_index - 1].last, -1)
    partition(numbers[pivot_index + 1..numbers.count - 1], numbers[pivot_index + 1..numbers.count - 1].last, -1)
  end
  @result
end

private

def smaller_than_pivot?(number, pivot)
  number <= pivot
end

def sort?(numbers)
  numbers.inject do |default, next_num|
    return false unless default <= next_num
    next_num
  end
  true
end

def swap(numbers, index, pivot_index)
  numbers[pivot_index], numbers[index] = numbers[index], numbers[pivot_index]
end



Benchmark.bm do |r|
  numbers = Array.new(1000) { rand 1000 }.uniq

  r.report 'quick sort' do
    quick_sort(numbers)
  end

  r.report 'bubble sort' do
    bubble_sort(numbers)
  end

  r.report 'original sort' do
    numbers.sort
  end
end
