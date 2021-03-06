class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :status, :destroy]
  before_action :set_categories, only: [:new, :edit, :create]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.where(status: 0).order(priority: :desc).page params[:page]
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    session[:category] = @categories
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    puts todo_params
    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to @todo.category, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def status
    @todo.status = params[:status]
    @todo.save!
    redirect_to root_path, notice: "#{@todo.title}が完了しました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :body, :priority, :category_id)
    end
    
    def set_categories
      @categories = Category.all
    end
end
