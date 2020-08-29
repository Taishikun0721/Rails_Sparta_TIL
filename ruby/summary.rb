
class Summary
  def self.show_result
    input = Array.new(25) { rand 1000 }.each_slice(5).to_a
    sum_columns = input.transpose.map { |num| num.sum }
    matrix_with_sum_columns = input.push(sum_columns).flatten(1)
    matrix_with_sum_columns.each.with_index(1) { |num, i| i % 5 == 0 ? print("#{num} |".rjust(7) + matrix_with_sum_columns[(i - 5)..(i - 1)].sum.to_s.rjust(7) + "\n") : print("#{num} |".rjust(7)) }
  end
end

Summary.show_result