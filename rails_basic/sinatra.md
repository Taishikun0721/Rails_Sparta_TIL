# Sinatraで基礎を固める
***

## 1.開発環境
### エディタ
- Cloud9


### 2.Sintra
### インストールと準備
- Rubyで簡単なWebアプリを作れる
- Rubyのファイルを最初に作成する
 ```
 <!-- 最初にgemをインストールする -->
 - gem install sintra  
Rubyのファイルを作成する
 - touch 好きなファイル名.rb
 ```
 - このファイルでHTTPリクエストの指定と変数の定義などを行う
 - railsのroutes,controllerが同じになったみたいなイメージ

### viewとerb
- まず「view」と言うフォルダをルート以下に作成する。
```
mkdir view
cd view
```
- このフォルダ以下に.erbと言う拡張子でファイルを作成するとそこに対してhtmlを記入したり最初に定義した変数に格納した値をブラウザに表示できる。
```
touch sumple.erb
@sumpleなどのインスタンス変数を定義していたらこの中で使用する事ができる
```

### public

- publicフォルダ以下にはインスタンス変数を渡さない静的なページやCSSファイルなどを格納する
```
mkdir public
cd public
touch sumple.html sumple.css
```
