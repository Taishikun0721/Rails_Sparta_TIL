
class Summary
  attr_accessor :base_array, :columns

  def initialize(columns:)
    if columns <= 15
      @columns = columns
    else
      @columns = 5
    end
    @base_array = Array.new(@columns * 5) { rand 1000 }.each_slice(@columns).to_a
  end

  def calculate_matrix_with_summary
    @matrix_with_rows_sum = add_columns_sum
    @matrix_with_rows_sum.flatten(1).each.with_index(1) { |num, i| i % @columns == 0 ? print("#{num} |".rjust(7) + @matrix_with_rows_sum[(i - @columns)..(i - 1)].sum.to_s.rjust(7) + "\n") : print("#{num} |".rjust(7)) }
  end

  private

  def add_columns_sum
    sum_columns = @base_array.transpose.map { |num| num.sum }
    (@base_array + sum_columns).flatten(1)
  end

  # def add_rows_sum
  #   sum_rows = @base_array.map { |num| num.sum }
  #   (@input + sum_rows).flatten(1)
  # end
  # ※作ってみたけど今回の実装には必要ないので不採用
end

summary = Summary.new(columns: 15)
# キーワード引数に何列で表示したいか入力。あまり長くても見辛いので15行以下は強制的に5行で出力。
summary.calculate_matrix_with_summary