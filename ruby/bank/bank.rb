class Coin
  def initialize(type, count)
    @type = type
    @count = count
  end

  def calc_money
    @type * @count
  end
end

class CoinType
  TEN = 10
  ONE_HUNDRED = 100
  FIVE_HUNDRED = 500
  ALL_KINDS_OF_COIN = [TEN, ONE_HUNDRED, FIVE_HUNDRED]
end

class Bank
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
        puts "貯金したのは#{total}円です"
        exit
      end
    end
  end

  private

  def save
    coin_type = Ask.how_type_of_money
    coin_amount = Ask.coin_amount
    coin = Coin.new(coin_type, coin_amount)
    add(coin)
  end

  def add(coin)
    @coins << coin
  end

  def total
    @coins.sum(&:calc_money)
  end

  def continue_saving?
    answer = Ask.continue_saving
    Ask::YES_OR_NO[answer]
    # リファクタリングしてて,これAskクラスに映してもいいのかなと思った。
    # けどstartメソッドの中がこっちの方がすっきりするからラップしていてもいいかも。。
  end
end


class Ask
  YES_OR_NO = { y: true, n: false }

  def self.how_type_of_money
    puts "何円貯金箱に入れますか？ press...#{CoinType::ALL_KINDS_OF_COIN.join(' or ')}"
    coin_type = gets.to_i
    return how_type_of_money unless CoinType::ALL_KINDS_OF_COIN.include?(coin_type)
    coin_type
  end

  def self.coin_amount
    puts "何枚入れますか？ press...1 or 2 or number you want"
    amount = gets.to_i
    return coin_amount if amount == 0
    amount
  end

  def self.continue_saving
    puts "続けて貯金しますか？ press... #{YES_OR_NO.keys.join(' or ')}"
    answer = gets.chomp.to_sym
    return continue_saving unless YES_OR_NO.keys.include?(answer)
    answer
  end
  # ユーザーに入力を尋ねる所はAskクラスを作成して切り出した。
end

bank = Bank.new
bank.start