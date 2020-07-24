# プロを目指す人の為のRuby入門
***


## 第1章
- Rubyは全てがオブジェクトでできている  
  - そのため、全ての物に対してメソッドを使用できる。
  ```
    1.to_s
    "1".to_s
    nil/to_s
  ```
  ***  

## 第2章
- if文について  
 - 後置ifはelseが使えない  
 普通のif文↓
 ```
 country = 'italy'  
 if country == 'italy'  
      puts 'ciao'  
 elsif country == 'japan'
      puts 'こんにちは'  
 else  
      puts 'hello'  
 end
=> ciao
 ```

 - 後置if↓  
 ```
 puts 'ciao' if country == 'italy'
 puts 'こんにちは' if country == 'japan'
 puts 'hello' <= が書けない
```

- falseとnil以外は全てtrue！
 - この場合,hogeがfalse,nil以外なら全て'trueです'が出力される  
 ```
 if hoge
        puts 'trueです'
 else
        puts 'falseです'
 end
```

## クラスについて

クラスは設計図の様な物で、メソッドなどを定義してそこからインスタンスを作成して使用する事ができる。
例えば、Userクラスがあったとすると

```
class User
    def initialize(:name)
        @user = user
    end
end

user = User.new('inokuchi') <= インスタンス作成

=> #<User:0x00007f86180c6f98 @name="inokuchi"> インスタンスが作成されている
```

newメソッドでインスタンスを作成した際に、自動的にinitializeメソッドが呼ばれる様になっている。さらに

```
class User
    def initialize(:name)
        @user = user
    end
end

user = User.new('inokuchi') <= インスタンス作成
p user.name 
=> test.rb:355:in `<main>': undefined method `name' for #<User:0x00007fd7f49bafe0 @name="inokuchi"> (NoMethodError)
```

Railsと同じ様にnameメソッドで中のデータを撮ろうとするとエラーが出る。つまりクラスはデフォルトではクラス外からのアクセスに対応していない
ではどうすれば、アクセスできる様になるのか。
```
  def name
    @name
  end
```

を追加してあげても呼び出す事ができる。しかしこの方法だと引数の個数だけメソッドを定義しないといけない。この場合に便利なメソッド
がある。
```
1. attr_reader => 外部から読み取りはできるけれど更新はできない
2. attr_writer => 外部から読み取りはできないが、書き込みはできる
3. attr_accessor => 外部から読み取りも更新もどちらもできる。
```

例えば先ほどの例を全て書くと
```
class User
    def initialize(:name)
        @user = user
    end

    def name
        @name
    end
end

user = User.new('inokuchi') <= インスタンス作成
p user.name 

=> "inokuchi"
```

こちらでも良い

```
attr_reader :name <= 追加

class User
    def initialize(:name)
        @user = user
    end
end

user = User.new('inokuchi') <= インスタンス作成
p user.name 

=> "inokuchi"
```

また更新の場合は

```
attr_writer :name <= 追加

class User
    def initialize(:name)
        @user = user
    end
    
    def name=(value)
        name = value
    end
end

user = User.new('inokuchi') <= インスタンス作成
p user.name 

=> "inokuchi"
```

となる