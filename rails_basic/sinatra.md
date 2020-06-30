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

### リクエストとレスポンス
- 今回の場合、app.rbに書かれた内容でリクエストを作成できる
 - 例えばWebサーバーのルートが欲しい場合のリクエストの作成方法はこうなる
 - Getメソッドの場合
 ```
 get '/' do
        erb :index
 end
 ```
上記を日本語で訳すと=>「Webサーバーのルートディレクトリにindex.erbを探して欲しいとリクエストを送る」
と言う内容になる

 - Postメソッドの場合
 ```
 post '/contacts' do
        redirect '/'
 end
```
上記を日本語で訳すと=>「webサーバーの/contactsに送信した内容を保存して欲しいと言うリクエストを送る」

- またredirectのレスポンスは「location: '/'」という内容で返ってきてその後すぐに、リクエストが送られるまたこの時再度、投られるメソッドは*Get**と決まっている


### GemとBundler

### Gemとは
- 他の誰かが作成した便利なプログラムを取ってきて、簡単に自分で使える様にする為のもの

- 例えばSinatraをインストールするには次の様に書く
```
gem install 'sinatra'
```

  - こうするとSinatraをインストールする事ができる
  - しかしこの方法でインストールしていると他の人にファイルを渡した時に何回もコマンドを打たせる事になる
  - それを防ぐためにでできたのが**Bundler**という仕組み

### Bundler
- BundlerはGemを管理するための仕組み
- 導入方法は簡単で
 ```
gem install bundler
 ```
と打つとインストールされ  

 ```
bundle init
 ```
で**Gemfile**が作成され

 ```
bundle install --path vender/bundle
 ```
で記入したGemfileに記載したGemが一括インストールされる。またオプションについてはvender以下にインストールしたGemを作成するというもの
