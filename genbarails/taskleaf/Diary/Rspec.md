# Rspec各種設定方法について

## 索引

### 1.初期構築
### 2.ジェネレータの設定(コマンド実行時に作成するファイルを決める)
### 3. Factory Botの導入方法
### 4.Capybaraの導入とlaunchyを使用したデバッグ
### 5.サポートモジュールの設定方法

Rspecの書き方ではなく、各種設定方法だけ忘れた時のために記載しておく。
***


### 1.初期構築
***
初期構築時間はまず最初にGemをインストールする

`Gemfile`
``` 
group :development, :test do
    gem 'rspec-rails', '~> 3.7'
end
```
開発環境とテスト環境の両方でRspecを読み込むため上記の場所に書く。
その後に下記コマンドを打つ事でRspecの設定ファイルが作成される。  

`ターミナル`
```
bin/rails g rspec:install
```
`結果`
```
create .rspec :設定ファイル
create spec :テスト格納ファイル
create spec/spec_helper.rb :カスタマイズ用helperファイル
create spec/rails_helper.rb :カスタマイズ用helperファイル
```

その後、出力を美しくするために.rspecファイルに1行記述をたす。  

`.rspec`
```
--format documentation
```
これでテスト結果の出力方法が変更される。

***
### 2.ジェネレータの設定(コマンド実行時に作成するファイルを決める)
***

railsの開発でrails g コマンドを使用した場合に、一緒にテスト用ファイルを作成してもらえる様に設定できる。
ただし、テストしない内容まで作成されてしまうので、それを制限する設定をする。  

`config/application.rb`
``` 
config.generators do |g|
    g.test_framework :rspec,
        fixture: true, 
        view_specs: false,
        helper_specs: false,
        routing_specs: false
end
```

上記内容を追加する事でジェネレータ使用時の作成ファイルを制限できる。
他にも設定したければ追加する。

***
### 3. Factory Botの導入方法
***

テストを実行する際のサンプルデータとして、フィクスチャとファクトリの2つがある。  
フィクスチャはYAML形式で書いてデータを作成する方法だが、今回はファクトリ設定する方法を記載する。

`Gemfile`
```
group :development, :test do
    gem 'rspec-rails', '~> 3.7'
    gem 'factory_bot_rails', '~> 4.11'
end
```

と記入して、Factory_botをインストールする。
***
### 4.Capybaraの導入とlaunchyを使用したデバッグ
***

システムテストと呼ばれる統合テストを作成する為のCapybaraを使用する。  
Capybaraを使用する事でモデルやコントローラーの動きを一括で表現できる。その中では今まで使用してきたFactoryBotも使用する事ができる。
まずCapybaraを使用する為の設定を行う。

`spec/spec_helper.rb`
```
require 'capybara/rspec' 

RSpec.configure do |config|
    config.before(:each, type: :system) do
        driven_by :selenium_chrome_headless
     end
end
```
を記載してHeadless Chromeを実行できる様にしておく。

これでシステムスペックを使用できる。  
そしてデバッグする時にはlaunchyというGemを使用する。

`Gemfile`
```
group :test do
    gem 'launchy', '~> 2.4.3'
end
```
を追記するこれでシステムスペックを使用する時に、スクリーンショットを記録してブラウザを自動で開く事ができる様になる。
スクリーンショットを撮りたい場所に
```
save_and_open_page
```
と打ち込んでテストを走らせるとそこのスクリーンショットが記録される。

あとは普通にbyebugbなども使用する事ができる。
***
### 5.サポートモジュールの設定方法
***

スペックをDRYに保ちたいときにサポートモジュールを使用する事で、繰り返しを防ぐ事ができる。
まずspec/support以下のモジュールを使用できる様に設定する。

`spec/rails_helper.rb`
```
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
```

その後に、./spec/support/hoge_support.rbを作成
その中に、モジュールを作成する
これが例

`spec/support/login_support.rb`
```
module LoginSupport
  def sign_in_as(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログインする'
    click_link '新規登録'
  end

  def create_task(task)
    fill_in '名前', with: task.name
    fill_in '詳しい説明', with: task.description
    click_button '登録する'
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
※ここは個別にモジュールを読み込んでもどちらでも良い。
```
こうする事で、システムスペックでも上記のメソッドが使用する事ができる。
