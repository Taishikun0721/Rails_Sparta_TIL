require 'byebug'
class Customer
  YES_OR_NO = {y: true, n: false }
  attr_accessor :shopping_bag
  def initialize
    @shopping_bag = []
  end

  def go_shopping
    puts '購入したい商品を入力してください。'
    Item::ITEMS_NUMBER.each { |key, value| puts "#{key}: #{value}" + " ¥#{Item::ITEMS_PRICE[value]}" }
    item = Item::ITEMS_NUMBER[gets.chomp.to_sym]
    shopping(item)
    if continue_shopping?
      go_shopping
    else
      how_much(@shopping_bag)
    end
  end

  def shopping(item)
    if item
      @shopping_bag << Item.new(item)
    else
      puts '入力し直してください。'
      go_shopping
    end
  end

  def continue_shopping?
    puts "買い物をまだ続けますか？(press #{YES_OR_NO.keys.join(' or ')} )"
    key = gets.chomp.to_sym
    return continue_shopping? unless YES_OR_NO.keys.include?(key)
    YES_OR_NO[key]
  end

  def how_much(shopping_bag)
    check = Check.new(shopping_bag)
    check.register
  end
end

class Item
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  ITEMS_NUMBER = {
      b: 'バッグ',
      p: 'パソコン',
      t: 'テレビ',
      d: '電子レンジ'
  }
  ITEMS_PRICE = {
      'バッグ' => 50_000,
      'パソコン' => 100_000,
      'テレビ' => 50_000,
      '電子レンジ' => 30_000
  }
end

class Check
  def initialize(shopping_bag)
    @shopping_items = shopping_bag
  end

  def register
    total = @shopping_items.map { |item| Item::ITEMS_PRICE[item.name] }
    puts "合計は#{total.sum}円です"
  end
end

customer = Customer.new
customer.go_shopping