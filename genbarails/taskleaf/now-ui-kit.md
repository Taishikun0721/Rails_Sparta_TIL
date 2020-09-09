# Bootstrap臭を消すNow-ui-kitを導入した。

Bootstrap臭を消す。now-ui-kitを導入してみたので導入方法をメモとして残したいと思う。

まずnow-ui-kitの[ページ](https://www.creative-tim.com/product/now-ui-kit?_ga=2.229913180.1131214762.1599395911-1296701376.1599395911#)に行き、zipファイルをダウンロードする。  

そしてrailsプロジェクトのassets/stylesheets以下にzipファイルの中にある**now-ui-kit.css**を配置する。

その後、application.html.erbから読み込む
```
= stylesheet_link_tag 'now-ui-kit.css'
```

これで、読み込めるだろうと思ってサーバー再起動して確認してみると
プリコンパイルに関するエラーが出現。（すみませんエラーメッセージ撮り忘れました。）


ひとまずエラーメッセージを読むとconfig/initializersに下記記述を追加しろとの事だったので追加
```
Rails.application.config.assets.precompile += %w( now-ui-kit.css )
```
記述をすると少しきれいになったbootstrapが出現した。

ただアセットパイプラインの理解も浅いので勉強しないといけないと感じた。

