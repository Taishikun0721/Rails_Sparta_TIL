class Coin
  COINS_TYPE = [10, 100, 500]

  def initialize(type)
    @type = type
  end

  def type
    @type
  end
end

class Bank
  YES_OR_NO = { y: true, n: false }

  attr_accessor :coins

  def initialize
    @coins = []
  end

  def start
    save

    while true do
      if continue_saving?
        save
      else
        total
        exit
      end
    end
  end

  private

  def save
    coin_type = how_much?
    if Coin::COINS_TYPE.include?(coin_type)
      coin = Coin.new(coin_type)
      add(coin)
    else
      puts 'コインのタイプが違う'
      save
    end
  end

  def add(coin)
    @coins << coin
  end

  def total
    puts  "貯金したのは#{@coins.sum(&:type)}円です"
  end

  def how_much?
    puts "何円貯金箱に入れますか？ press..10 or 100 or 500"
    coin_type = gets.to_i
  end

  def continue_saving?
    puts '続けて貯金しますか？ press... y or n '
    answer = gets.chomp.to_sym
    return continue_saving? unless YES_OR_NO.keys.include?(answer)
    continue_saving_answer(answer)
  end

  def continue_saving_answer(answer)
    YES_OR_NO[answer]
  end
end

bank = Bank.new
bank.start