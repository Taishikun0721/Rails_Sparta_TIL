# 質問会質問

### ルーティングについて

[Railsガイド](https://railsguides.jp/routing.html?version=6.0#%E3%82%B3%E3%83%AC%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E3%83%AB%E3%83%BC%E3%83%86%E3%82%A3%E3%83%B3%E3%82%B0%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B)  

- 名前空間をルーティングにつけるのは、画面を分けて管理する為か？
- scope, namespace,moduleと言う使い方があるが、どの様なケースで使い分けるのか気になった

1.scope => urlの前に指定した名前がつく url → admin/todos, コントローラー /todos/index 
→管理者用のurlに飛ぶリンクがあるが、コントローラーでは管理者以外と共通処理をする

2.namespace => urlの前に名前空間がつく url → admin/todos, コントローラー admin/todos/index
→管理者用のurlに飛ぶリンクもあり、尚且つコントローラーでは管理者専用のアクションがある

3.module => urlの前に名前空間がつく url → /todos, コントローラー admin/todos/index
→管理者用のリンクがないが、コントローラーでは管理者専用のアクションがある

1、2は管理者用のログインがあってviewを分けているのかなと考えた。  
ただ3についてはどの様な時に使うのか想像もつかなかった


