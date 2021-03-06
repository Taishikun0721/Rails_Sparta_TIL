class Calender
  require 'date'
  def calender(year:,month:,day: 1)
    @@date = Date.new(year,month,day)
    print spaces(space: 8).to_s + @@date.strftime("%B").to_s
    print spaces(space: 2).to_s + @@date.year.to_s + "\n"
    puts ' Sun Mon Tue Wed Thu Fri Sat'
    set_start_day(year, month, day)
    show_days(year,month,day)
    puts "\n"
  end
  # 呼び出し用メソッド
  
  def spaces(space:)
    print " " * space
  end
  #スペースを挿入するためのメソッド

  def set_start_day(year, month, day)
    array_of_space = []
    0.step(24,4) { |n| array_of_space << n }
    array_of_space = array_of_space.map.with_index { |n,i| [i,n] }.to_h
    spaces(space: array_of_space[@@date.wday])
  end
  # 月の開始日をスペースで再現する

  def show_days(year, month, day)
    last_day = Date.new(year, month, -1).day
    day_number = (1..last_day).to_a
    day_number.each do |date|
      if Date.new(year, month, date).wday != 6
        print date.to_s.rjust(4) 
      else
        print date.to_s.rjust(4) + "\n"
      end
    end
  end
  # 日を表示する
end

cal = Calender.new
cal.calender(year:2020,month:6)