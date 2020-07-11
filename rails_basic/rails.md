# Rails全般に関してのメモ

## redirectとrennderのちがい

- redirecthはコントローラーを経由して表示されて、renderはただviewが表示される
- そのためflashの書き方に違いがでる
```
def index
    @hoge = Hoge.all
end

def create
    @hoge = Hoge.create(hoge_params)
    redirect_to root_path, notioce: "hogeを作成しました"
end

private

def hoge_params
    params.require(:hoge).permit(:huga, :foo, :bar)
end
```

