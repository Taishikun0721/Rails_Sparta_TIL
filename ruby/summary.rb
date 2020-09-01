
class Summary
  attr_reader :base_array, :columns

  def initialize(columns:)
    if columns <= 15
      @columns = columns
    else
      @columns = 5
    end
    @base_array = Array.new(self.columns * 5) { rand 1000 }.each_slice(self.columns).to_a
  end

  def base_of_matrix
    add_columns_sum.flatten(1)
  end

  def calculate_matrix_with_sum
    base_of_matrix.each.with_index(1) { |num, i| i % self.columns == 0 ? print("#{num} |".rjust(7) + base_of_matrix[(i - self.columns)..(i - 1)].sum.to_s.rjust(7) + "\n") : print("#{num} |".rjust(7)) }
  end

  private

  def add_columns_sum
    base_array + generated_columns_sum
  end

  def generated_columns_sum
    base_array.transpose.map { |num| num.sum }
  end

end

summary = Summary.new(columns: 5)
# キーワード引数に何列で表示したいか入力。あまり長くても見辛いので15行以下は強制的に5行で出力。
summary.calculate_matrix_with_sum
