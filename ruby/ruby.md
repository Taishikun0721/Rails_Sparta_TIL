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
