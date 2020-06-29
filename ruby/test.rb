# if文
puts 'if文'
country = 'usa'

if country == 'italy'
  puts 'ciao'
elsif country == 'japan'
  puts 'こんにちは'
else
  puts 'hello'
end
# ----------------------------------------------



# 後置if
puts '後置if'
puts 'ciao' if country == 'italy'
puts 'こんにちは' if country == 'japan'
# ----------------------------------------------



# nilとfalse以外trueテスト

hoge = nil

if hoge
  puts 'true'
else
  puts 'false'
end
# ----------------------------------------------




def fizzbuzz(num:)
  number = 0
  while number <= num do
    if number % 15 == 0
      puts 'fizzbuzz'
    elsif number % 3 == 0
      puts 'fizz'
    elsif number % 5 == 0
      puts 'buzz'
    else
      puts number
    end
    number +=  1
  end
end

fizzbuzz(num:100)
# ----------------------------------------------



# カレンダー

# require 'date'

# def spaces(space:)
#     printf " " * space
# end
# # スペースでカレンダーを表現する

# def week_days()
#   wd = (0..6).to_a
#   wd.each do |w|
#     printf " #{(Date.new(2020,6,1) + w).strftime("%a")}"
#   end
#   puts "\n"
# end
# # 曜日を表示する

# def set_start_day(year, month, day)
#   Date.new(year,month,day).wday
# end 

# def show_days(year, month, day)
#   last_day = Date.new(year, month, -1).day
#   day_number = (1..last_day).to_a
#   day_number.each do |d|
#     printf spaces(space: 2).to_s + d.to_s if Date.new(year,month,d).day >= 10
#     printf spaces(space: 2).to_s + d.to_s if Date.new(year,month,d).wday == 1 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 2 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 3 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 4 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 5 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 6 and Date.new(year,month,d).day < 10
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 0 and Date.new(year,month,d).day < 10
#     puts "\n" if Date.new(year,month,d).wday == 0
#   end
# end


# def calender(year:,month:,day:)
#   date = Date.new(year,month,day)
#   printf spaces(space: 8).to_s + date.strftime("%B").to_s
#   printf spaces(space: 2).to_s + date.year.to_s + "\n"
#   week_days
#   show_days(year,month,day)
# end
# # 実行用関数

# calender(year:2020,month:7,day:1)
# # 作成中
# ----------------------------------------------



# 配列操作の練習

  # ランキング機能

  # 事前にDBにcounter_cultureなどで数えたい数をDBにいれとく
    like_count = [100,111,32,3434,33,55,22,0,686] 
    b = 0
    like_ranking = like_count.sort.reverse.map {|a| [b += 1,a]}
  # ハッシュに変換
    puts like_ranking
# ----------------------------------------------




  # 連番で配列作成

    a = (1..10).to_a
    puts a
# ----------------------------------------------



  # 配列を降順にする

    puts a.sort.reverse
# ----------------------------------------------



  # 配列の要素を加工して新しい配列に再格納する
  # aの値がbの中に順番に入っていくそして「b * 2」をして新しい配列に格納し直す
  
    new_array = a.map { |b| b * 2 }
# ----------------------------------------------



  # これでハッシュに変換
    new_array = a.map { |b| [b,b * 2] }.to_h
# ----------------------------------------------



  # 配列内で当てはまる要素を抽出して配列を作成する
    even_numbers = a.select {|n| n.even? }
    even_numbers = a.select(&:even?)
  # 上の２つの分は同じ意味
    puts even_numbers
# ----------------------------------------------



  # 配列内で当てはまる数値を削除して再格納する
    puts a.reject(&:even?)
# ----------------------------------------------



  