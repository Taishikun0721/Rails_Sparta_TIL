require 'minitest/autorun'
require_relative '../summary'

class SummaryTest < Minitest::Test

  def test_set_base_array
    summary = Summary.new(columns: 5)
    assert_equal summary.base_array.flatten(1).length, summary.columns * 5
  end

  def test_force_to_5
    summary = Summary.new(columns: 100)
    assert_equal summary.base_array.flatten(1).length, 25
  end

  def test_base_of_matrix
    summary = Summary.new(columns: 5)
    assert_equal summary.base_of_matrix[(-5)..(-1)].sum, summary.base_array.flatten(1).sum
  end
end