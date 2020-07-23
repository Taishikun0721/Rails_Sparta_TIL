
KATAKANA = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホヤ　ユ　ヨマミムメモ'.freeze

name_line = %w(ウエダ イノクチ カサイ サイトウ マル ヤマシタ)
head_number = []

name_line.each do |name|
  name_value = KATAKANA.index(name.chr) % 5
  head_number << KATAKANA.index(name.chr) - name_value
end

name_array = []
head_number.each_with_index { |h, i| name_array << [KATAKANA[h], name_line[i]] }

answer = {"ア"=>"イノクチ"}
test = [[1, 'name2']].to_h

p answer.merge(test) {|key, value3, value4| [value3] + [value4]}.to_a.flatten(1)

name_array.each { |name| p answer.merge([name].to_h) { |key, value, value2| [value] + [value2] }  }
∑∑