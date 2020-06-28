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


# fizzbuzz
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



# カレンダー

# require 'date'
#
# def spaces(space:)
#     printf " " * space
# end

# def week_days()
#   wd = (0..6).to_a
#   wd.each do |w|
#     printf " #{(Date.new(2020,6,1) + w).strftime("%a")}"
#   end
#   puts "\n"
# end
#
# def show_days(year, month, day)
#   last_day = Date.new(year, month, -1).day
#   day_number = (1..last_day).to_a
#   day_number.each do |d|
#     printf spaces(space: 2).to_s + d.to_s if Date.new(year,month,d).wday == 1
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 2
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 3
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 4
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 5
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 6
#     printf spaces(space: 3).to_s + d.to_s if Date.new(year,month,d).wday == 0
#     puts "\n" if Date.new(year,month,d).wday == 0
#   end
# end
#
#
# def calender(year:,month:,day:)
#   date = Date.new(year,month,day)
#   printf spaces(space: 8).to_s + date.strftime("%B").to_s
#   printf spaces(space: 2).to_s + date.year.to_s + "\n"
#   week_days
#   show_days(year,month,day)
# end
#
# calender(year:2020,month:6,day:1)
# 作成中
