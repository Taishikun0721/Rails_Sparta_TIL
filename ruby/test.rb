# # if文
# puts 'if文'
# country = 'usa'
#
# if country == 'italy'
#   puts 'ciao'
# elsif country == 'japan'
#   puts 'こんにちは'
# else
#   puts 'hello'
# end
# # ----------------------------------------------
#
#
#
# # 後置if
# puts '後置if'
# puts 'ciao' if country == 'italy'
# puts 'こんにちは' if country == 'japan'
# # ----------------------------------------------
#
#
#
# # nilとfalse以外trueテスト
#
# hoge = nil
#
# if hoge
#   puts 'true'
# else
#   puts 'false'」
# # ----------------------------------------------
#
#
#
#
# def fizzbuzz(num:)
#   number = 0
#   while number <= num do
#     if number % 15 == 0
#       puts 'fizzbuzz'
#     elsif number % 3 == 0
#       puts 'fizz'
#     elsif number % 5 == 0
#       puts 'buzz'
#     else
#       puts number
#     end
#     number +=  1
#   end
# end
#
# fizzbuzz(num:100)
# # ----------------------------------------------
#
#
#
# # カレンダー
#
# require 'date'
#
# def spaces(space:)
#     print " " * space
# end
# # スペースでカレンダーを表現する
#
# def week_days()
#   wd = (0..6).to_a
#   wd.each do |w|
#     printf " #{(Date.new(2020,6,1) + w).strftime("%a")}"
#   end
#   puts "\n"
# end
# # 曜日を表示する
#
# def set_start_day(year, month, day)
#   Date.new(year,month,day).wday
# end
#
# def show_days(year, month, day)
#   last_day = Date.new(year, month, -1).day
#   day_number = (1..last_day).to_a
#
#   day_number.each do |d|
#     if Date.new(year,month,d).wday != 0
#       print spaces(space: 2).to_s + d.to_s.rjust(2)
#     else
#       print spaces(space: 2).to_s + d.to_s.rjust(2) + "\n"
#     end
#   end
# end
#
#
# def calender(year:,month:,day:)
#   date = Date.new(year,month,day)
#   print spaces(space: 8).to_s + date.strftime("%B").to_s
#   print spaces(space: 2).to_s + date.year.to_s + "\n"
#   week_days
#   show_days(year,month,day)
# end
# # 実行用関数
#
# calender(year:2020,month:6,day:1)
# # 作成中
# # ----------------------------------------------
#
#
#
# # 配列操��の練習
#
#   # ランキング機能
#
#   # 事前にDBにcounter_cultureなどで数えたい数をDBにいれとく
#     like_count = [100,111,32,3434,33,55,22,0,686]
#     b = 0
#     like_ranking = like_count.sort.reverse.map {|a| [b += 1,a]}
#   # ハッシュに変換
#     puts like_ranking
# # ----------------------------------------------
#
#
#
#
#   # 連番で配列作成
#
#     a = (1..10).to_a
#     puts a
# # ----------------------------------------------
#
#
#
#   # 配列を降順にする
#
#     puts a.sort.reverse
# # ----------------------------------------------
#
#
#
#   # 配列の要素を加工して新しい配列に再格納する
#   # aの値がbの中に順番に入っていくそして「b * 2」をして新しい配列に格納し直す
#
#     new_array = a.map { |b| b * 2 }
# # ----------------------------------------------
#
#
#
#   # これでハッシュに変換
#     new_array = a.map { |b| [b,b * 2] }.to_h
# # ----------------------------------------------
#
#
#
#   # 配列内で当てはまる要素を抽出して配列を作成する
#     even_numbers = a.select {|n| n.even? }
#     even_numbers = a.select(&:even?)
#   # 上の２つの分は同じ意味
#     puts even_numbers
# # ----------------------------------------------
#
#
#
#   # 配列内で当てはまる数値を削除して再格納する
#     puts a.reject(&:even?)
# # ----------------------------------------------

b = (1..10).to_a

b.length

a = [1,2,3]

puts a

a << 5

a.delete_at(3)
puts a

puts 10.divmod(3)
# 余を返すメソッド

numbers = (1..4).to_a
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end

puts sum

numbers.each {|n| sum += n}
puts sum

array =['ruby', 'java','perl'].map(&:upcase)

puts array

ten_number = (1..10).to_a
ten_number.each_with_index {|a,b| puts a; puts b}


def charge(age)
  case age
    when 0..5
      puts 0
    when 6..12
      puts 300
    when 13..18
      puts 600
    else
      puts 1000
    end
end

charge(14)
odd_number = ten_number.select { |n| n.odd? }

puts odd_number
example = ten_number.values_at(0, 2, 4, 6)
puts example


puts ten_number.size

puts (ten_number + odd_number).size
puts (ten_number - odd_number).size

a, *b = 1, 2, 3
puts a,b


def greeting(*name)
  name = name.compact
  name.map { |n| n.upcase }
  puts "#{name.join('さんと')},こんにちは"
end
*a = %w(apple lemon meron)
greeting('tanaka','suzuki','andrew',nil,'satomi', *a)


puts 'inokuchitaishiro'.chars

new_array = Array.new(10) {'default'}
str = new_array[0]
str = str.upcase!

puts new_array


fruits = %w(apple orange melon)
fruits.each_with_index {|fruit, i| puts "#{i}番目の#{fruit}です"}

fruits_with_index = fruits.map.with_index {|fruit, i| "#{i}: #{fruit}"}
puts fruits_with_index


dimensions = [[10,20], [100,200],[1000,2000]]

dimensions.each {|width, height| puts width * height }
dimensions.each.with_index(1) {|(width, height), i| puts "#{i}つ目の土地の面積は#{width * height}です。"}

names = %w( 田中 鈴木 佐藤)
names.map {|n| n.upcase}.join('と')

sum = 0
sum_array = Array.new
puts 5.times {|n| sum += 1}


a = []
test = []
1.step(10, 2) {|n| test << n}

while a.size < 5 do a << 1 end
puts a

ten_number.each do |n|
  puts n
  break if n == 9
end

i = 0
while i < ten_number.size
  n = ten_number[i]
  puts n
  i += 1
  break if i == 7
end



puts {}.class

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
currencies['italy'] = 'euro'
puts currencies

currencies.each {|key,value| puts "このハッシュのキーは#{key}です。値は#{value}です。"}


puts currencies.length

currencies.delete('japan')
puts currencies

puts :apple ,:japan ,:ruby_is_fun

p :apple.class, 'apple'.class

hash = { japan: :yen, us: :dollar, india: :ruppe }
puts hash[:japan]


puts hash[:us]

def buy_burger(drink:, potato:)
  if drink && potato
    puts 'ドリンクポテト'
  else
    puts 'なし'
  end
end
params = { drink: true, potato: true }
buy_burger(params)


def convert_length(length:, ex_unit:, unit:, **other)
  length_hash = { m: 1.0, ft: 3.28, in: 39.37 }
  puts "#{(length / length_hash[ex_unit] * length_hash[unit]).to_s}です"
end

convert_length(length: 35000, ex_unit: :ft, unit: :m, chicken: true)

name_hash = { inomatu: :taishiro, inomatu2: :tomoka, inokuchi: :marin, matuo: :ai }
puts name_hash.keys

puts name_hash.has_key?(:inokuchi)
