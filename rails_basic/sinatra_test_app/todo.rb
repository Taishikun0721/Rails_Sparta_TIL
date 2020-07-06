require 'rubygems'
require 'bundler'

Bundler.require

class Todo < ActiveRecord::Base
    validates_presence_of :todo
end

use Rack::MethodOverride

set :database, {adapter: "sqlite3", database: "todos.sqlite3"}
enable :sessions

get '/' do
    @message = session.delete :message
    @todo = Todo.all
    erb :index
end

get '/todo_new' do
    @message = session.delete :message
    erb :todos_form
end

post '/todos' do
    todo = params[:todo]
    @todo = Todo.new(todo: todo)
    if @todo.save
        session[:message] = "タスクを登録しました"
        redirect '/'
    else
        session[:message] = "タスクを登録できませんでした"
        redirect '/todo_new'
    end
end

delete '/todos/:id' do
    target_todo = Todo.find(params[:id])
    if target_todo.destroy
        session[:message] = "削除しました"
        redirect '/'
    else
        session[:message] = "削除できませんでした。もう一度実行してください"
    end
end

get '/todos/:id/edit' do
    @todo = Todo.find(params[:id])
    erb :edit_todos_form
end

put '/todos/:id/done' do
    target_todo = Todo.find(params[:id])
    session[:message] = "#{target_todo.id}版のタスクが完了しました"
    if target_todo.todo.include?("(済)")
        session[:message] = "#{target_todo.id}番のタスクは既に完了しています"
        redirect '/'
    else 
        session[:message] = "#{target_todo.id}番のタスクが完了しました"
        todo = target_todo.todo + "(済)"
        target_todo.update(todo: todo)
        redirect '/'
    end
end

put '/todos/:id' do
    target_todo = Todo.find(params[:id])
    session[:message] = "#{target_todo.id}番のタスクを更新しました"
    todo = params[:todo]
    if target_todo.update(todo: todo)
        session[:message] = "#{target_todo.id}番のタスクを更新しました"
        redirect '/'
    else 
        session[:message] = "空のタスクには変更できません"
        redirect '/todos/:id/edit'
    end
end