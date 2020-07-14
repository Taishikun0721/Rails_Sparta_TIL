require 'sinatra/activerecord'
require File.expand_path '../spec_helper.rb', __FILE__

describe "テスト" do
    context "get" do
        it "/が表示されるか" do
            get '/'
            expect(last_response).to be_ok
        end
        
        it "todos_newが表示されるか" do
            get '/todo_new' 
            expect(last_response).to be_ok
        end
        
        it "/todos/:id/editが表示されるかどうか" do
            todo = 'テスト'
            Todo.create(id: 1 ,todo: todo)
            edit_params = Todo.find(1).id
            get "/todos/#{edit_params}/edit"
            expect(last_response).to be_ok
        end
    end
    context "post" do
        it "タスクが登録できるかどうか" do
            todo = 'テスト'
            todo_params = Todo.create(todo: todo)
            expect(todo_params.todo).to eq "テスト"
        end 
        
        # it "登録成功後に/にリダイレクトするか" do
        #     get '/todo_new'   
        #     todo = 'テスト'
        #     todo_params = Todo.new(todo: todo)
        #     expect(response).to redirect '/'
        # end
    end
    
    context "update" do
        it "タスクが更新されるかどうか" do
            todo = 'テスト'
            Todo.create(id: 2, todo: todo)
            Todo.find(2).update(todo: "テスト1")
            expect(Todo.find(2).todo).to eq "テスト1"
        end
    end
    
    context "destroy" do
        it "タスクが消去されるかどうか" do
            todo = "テスト"
            Todo.create(id: 3, todo: todo)
            count_id = Todo.count
            Todo.find(3).destroy
            expect(Todo.count).to eq (count_id - 1)
        end
    end
end