require 'minitest/autorun'
require_relative '../rgb'

class RgbTest < Minitest::Test
  def test_to_hex
    assert_equal '#ffffff', to_hex(255, 255, 255)
    assert_equal '#000000', to_hex(0, 0, 0)
  end

  def test_to_ints
    assert_equal [255,255,255], to_ints(hex_keyword: '#ffffff')
  end
end
‘
