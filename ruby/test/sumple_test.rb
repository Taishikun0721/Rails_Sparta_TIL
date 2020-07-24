
require 'minitest/autorun'
require_relative '../test'

class SumpleTest < Minitest::Test
  def test_sumple
    assert_equal 'RUBY', 'ruby'.upcase
  end

  def test_delete
    assert_equal [1,2, 3, 4, 5], (1..5).to_a
  end

  def test_array
    assert_equal 55, (1..10).sum
  end


end
