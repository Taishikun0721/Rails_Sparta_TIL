class Animal
  def call_say(someanimal)
    someanimal.say
    # someanimalが渡された引数で渡されたインスタンスになる。そして各クラスのsayメソッドを呼び出す。
  end
end

#↑ ここから上が呼び出し側のクラスになる。つまり、このクラスのインスタンス変数のメソッドに引数に条件分岐させたいインスタンスを渡す。（dog, catなど）

class Dog
  def say
    puts 'ワンワン'
  end
end

class Cat
  def say
    puts 'にゃにゃ'
  end
end

class Human
  def say
    puts '腹減った'
  end
end
animal = Animal.new
# 今回はanimalクラスのインスタンスにdog, cat, humanのインスタンスを渡す。そして引数に渡されたインスタンスには同じメソッドが渡されている。
# 条件としては①同じメソッド名で、引数の数も同じである必要がある。


dog = Dog.new
cat = Cat.new
human = Human.new
# インスタンス作成

animal.call_say(dog)
animal.call_say(cat)
animal.call_say(human)
# それぞれcall_sayメソッドの引数にする。

