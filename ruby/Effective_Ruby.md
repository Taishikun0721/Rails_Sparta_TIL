# Effective Ruby１日目

## 索引 

### 1.Rubyは何を真と捉えているのか
### 2.オブジェクトはnilかもしれないと言うことを忘れてはいけない
***

### 1.Rubyは何を真と捉えているのか
***

Rubyは**nil**と**false**以外を真と捉えている。
そのため、0は真である。

また、falseとnilを区別しなければいけない時は下記の様なnil?メソッドを使用する。

```
hoge.nil?
```  
の様に使用できる。

またfalseを左側に置いた場合、false == falseの関係でないとtrueが帰らないのでこの方法でも判断できる。

```
p false == false
=> true 

false == nil
=> false
```
***
### 2.オブジェクトはnilかもしれないと言うことを忘れてはいけない
***

rubyのアプリケーションでは、至る所からnilが入ってくる可能性がある。
そのため、常にnilかどうか判断する必要がある。

```
person.save if person
person.save if !person.nil?
person.save unless person.nil?
```

の様なRailsでよく使用する様な形でnilかどうかを判断する。

またもう一つの考え方として,nilが入らない様にチェックするのではなく
nilから期待している型に変換してしまう方法も取れる。例えば

```
def capitalizes_name
    self.name.capitalize
    ※このままだと、selfがnilだとエラーが出る
 
    self.name.to_s.capitlize
    ※こうする事で、nilになることを防げる
end
```

またto_s, to_i, to_f なども同じ様に使用できる。

配列の場合は,compactメソッドを使用することで、nilを取り除ける。

```
name = [first, middle, last].conpact.join(' ')
```

の様にすることで、nilを排除できる。
