class Calender
  require 'date'
  
  def calender(year:,month:,day: 1)
    @@date = Date.new(year,month,day)
    print spaces(space: 8).to_s + @@date.strftime("%B").to_s
    print spaces(space: 2).to_s + @@date.year.to_s + "\n"
    week_days
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
    spaces(space: 24) if @@date.wday == 0
    spaces(space: 0) if @@date.wday == 1
    spaces(space: 4) if @@date.wday == 2
    spaces(space: 8) if @@date.wday == 3
    spaces(space: 12) if @@date.wday == 4
    spaces(space: 16) if @@date.wday == 5
    spaces(space: 20) if @@date.wday == 6
  end 

  # 月の開始日をスペースで再現する

  def week_days()
    wd = (0..6).to_a
    wd.each do |w|
      printf " #{(Date.new(2020,6,1) + w).strftime("%a")}"
    end
    puts "\n"
  end
  # カレンダーの曜日を表示する

  def show_days(year, month, day)
    last_day = Date.new(year, month, -1).day
    day_number = (1..last_day).to_a
    day_number.each do |date|
      if Date.new(year,month,date).wday != 0
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