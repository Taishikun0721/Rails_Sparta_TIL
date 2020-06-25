# if文

country = 'usa'

if country == 'italy'
  puts 'ciao'
elsif country == 'japan'
  puts 'こんにちは'
else
  puts 'hello'
end

# 後置if

puts 'ciao' if country == 'italy'
puts 'こんにちは' if country == 'japan'

# nilとfalse以外trueテスト

hoge = nil

if hoge
  puts 'true'
else
  puts 'false'
end
