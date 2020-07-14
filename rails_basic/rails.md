# Rails全般に関してのメモ

## redirectとrennderのちがい

- redirecthはコントローラーを経由して表示されて、renderはただviewが表示される
- そのためflashの書き方に違いがでる
```
def index
    @hoge = Hoge.all
end

def create
    Hoge.create(hoge_params)
    １:)redirect_to root_path, notioce: "hogeを作成しました"
    2:)render "index"
       flash.now[:notice] = "hogeを作成しました"
    3:)flash[:notice] = "hogeを作成しました"
end

private

def hoge_params
    params.require(:hoge).permit(:huga, :foo, :bar)
end
```


- 2:)と3:)の違い下記の通りで

```
flash.now[:notice]  →　そのリクエストで表示終了
    - ridirect_to　→　表示すらされない
    - render →　レンダリングされた画面だけでて次のリクエストの時には消える

flash[:notice] → 次のリクエストまで表示される
    - ridirect_to　→   リダイレクト先の画面まで表示されて次のリクエストの時には消える
    - render →　レンダリング先の画面で出て、その次のリクエストも出て2個先のリクエストで消える
```

## todoの完了機能実装方法

1.まずtodo機能を実装しているモデルにカラムを追加する

```
rails g migration add_status_to_todos

add_column :todos, :status, :integer, default: 0, null, false
みたいな感じでカラムを作成
```

2.デフォルトの値は0にしておいて、0か1かで完了を判断する

```
コントローラーは1以外の物を全て表示したいので

def index
    @todos = Todo.where(status: 0)
end

逆に完了を表示するメソッドは

def done
    @done_todos = Todo.where(status: 1)
end

の様になる
```

また新たにメソッドを追加する時に使用するルーティングの書き方は

```
resources :todos do
　member :done do
　　get 'status'
  end
end

```

と書くと

**get**

/todos
/todos/id
/tods_new
/todos/id/edit

**post**
/todos

**delete**

/todos

**put**

/todos/id