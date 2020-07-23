require 'minitest/autorun'
require './bingo'

class BingoTest < Minitest::Test
  def test_bingo
    assert_equal 'foo', 'foo'
  end
end