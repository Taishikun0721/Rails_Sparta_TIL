
def to_hex(r, g, b)
  hex = '#'
  rgb = [r, g, b]
  rgb.each {|n| hex += n.to_s(16).rjust(2, '0')}
  hex
end

def to_ints(hex_keyword:)
  hex = hex_keyword
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r, g, b].map { |n| n.hex }
end
