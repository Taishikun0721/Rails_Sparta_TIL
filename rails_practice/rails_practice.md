# Railsの基礎知識

### Railsのインストール
まず最初にGemfileを作成する
```
bundle init
```
するとGemfileが作成されるので中にRailsのgemを記載する
```
gem 'rails', '~> 5.2.1'
```

その後
```
bundle install
```
これでgemがインストールされてrailsが使用できる状態になっているのでRailsのプロジェクトを作成してみる
```
rails new　プロジェクト名
```
これで大量にファイルが作成されるまたGemfileの内容は上書きされる

### Scaffoldを使用してみる
RailsではScaffoldと呼ばれる最初に基本のCRUDが簡単に作成できるコマンドが用意されている
```
rails g scaffold モデル名 カラム名:データ型,カラム名:データ型
```
これで指定したモデル名とカラムを持ったアプリが作成される。

### Railsの全体像規約について
- MVCモデルというものが採用されている
