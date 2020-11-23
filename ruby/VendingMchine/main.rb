require_relative './drink'
require_relative './vending_machine'

class Main
  def start
    vm = VendingMachine.new

    drink = vm.buy(500, Drink.new('coke'))
    charge = vm.refound

    if drink != null && drink.get_kind  == 'coke'
      puts 'コーラ買えたわ。'
    else
      puts 'コーラ買えんかった。'
    end
  end
end