# Rails newをする時&した後にする事

## rbenvでversionを確認する。

使用するRubyとRailsは入っている前提にします。

最初に


```
rbenv versions
```
でバージョンを確認して

```
rbenv local 2.5.1
```
で切り替える

## Rails new

Rails newするときに必要がないものはオプションで最初に省くと良い。
今回はturbolinksとcoffee-railsは使用しないので省く
またDBにはpostgresqlを指定する。

```
rails new app名　-d postgresql --skip-coffee --skip-turbolinks
```

これでOK


## Gemfile編集

さらに余計な物を省いていく

###gem 'tzinfo-data'

これがないとwindowsでタイムゾーンを指定できないらしい
Macだから関係ないから削除

###gem 'chromedriver-helper'
自分はいつもgem 'webdrivers'に書き換える。
Everyday-raildでもそうしてるから

ひとまずそんなところです。


##　Git管理しないファイルを指定
config/database.yml
はパスワードなどを書く可能性があるので、.gitignoreファイルに設定する。


## Slimの導入

`Gemfile`

```
gem 'html2slim'
gem 'slim-rails'
```
を追加する。

そして元からあるlayout以下のファイルをslimに差し替える

```
bundle exec erb2slim app/views/layouts --delete
```

このコマンドでslimに変更される。


## Rspecの導入

まずGemfilleを下記の様に編集する。
developmentとtest環境で使用するので

```
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rspec-rails', '~> 3.7'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'launchy', '~> 2.4.3'
  # テストデバッグ用にスクリーンショットが取れる。
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers'
end

```
この様に変更する。

■変更点

```
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rspec-rails', '~> 3.7'
```
が追加されている。

Factory_botはテストデータを簡単に作成するgem
rspec-raisはRspecを導入する為のgem

```
  gem 'webdrivers'
  gem 'launchy', '~> 2.4.3'
```


webdriversはsystem_specの際に使用する。chromedriverが同梱されているので追加する。
launchyはテストでデバッグをする際に、スクリーンショットを撮ってくれる。
この際には

```
save_and_open_page
```

と記入したら良い。（記入したところの画面でスクリーンショットを撮ってくれる。）

その後に実施しないspecを作成しない様に、設定する。

`config/application.rb`

```
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework :rspec, view_spec: false, helper_spec: false, routing_spec: false
      g.template_engin :slim
    end
```

こんな感じで設定した。
また上記の様に、rspec以外のファイルも設定できる。
ここで、rails g コマンドを使用した時に作られる。ファイルをコントロールできる。

## Rubocop
Rubocopの設定はまず最初にgemを導入する。

```
  gem 'rubocop-rails', require: false
```

を導入するdevelopment環境だけで問題ないと思う。
その後に、プロジェクト直下に`.rubocop.yml`を作成する。

そしてここには、何を許容して、何を適応するかを書き込んでいく。

ただしこのままでは、エラーがありえない量出てくるので、一度
そルールを許容したいその時に下記、コマンドをうつ

```
rubocop --auto-gen-config
```

このコマンドを打つとrubocop_todo.ymlと言うファイルが作成されて
ここに今、あるエラーが全て記載される。

そしてこの内容を

```
inherit_from: .rubocop_todo.yml
```

.rubocop.ymlで読み込むと全て無視する様な設定になる。
ただこれでは全てのエラーが無視されているので、意味がない。

なので.rubocop.ymlにルールを上書きして、独自のルールを作っていく様なイメージになる。


あとはbootstrapとnow-ui-kitを導入した後に
custom-bootstrap.scssを作成して少しいじって初期構築完了！





