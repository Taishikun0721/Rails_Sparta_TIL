class VendingMachine

  def drink_buy(payment, kind_of_drink)
    stock_of_coke = Stock.new(5)
    stock_of_diet_coke = Stock.new(5)
    stock_of_tea = Stock.new(5)

    if payment != Coin::ONE_HANDRED && payment != Coin::FIVE_HANDRED
      change.add(payment)
      false
    end

    if kind_of_drink == DrinkType::COKE && stock_of_coke.quantity == 0
    end
  end
end