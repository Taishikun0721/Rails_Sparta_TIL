class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @tasks.generate_csv, filename: "tasks-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if params[:back].present?
      render :new
      return
    end

    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      SampleJob.perform_later
      logger.debug "#タスク：#{@task.attributes.inspect}"
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if params[:back].present?
      render :edit
      return
    else
      @task.update!(task_params)
      redirect_to @task, notice: "タスク「#{@task.name}」を更新しました"
    end
  end

  def destroy
    @task.destroy
  end

  def import
    if params[:file]
      @task = current_user.tasks.import(params[:file])
      if @task.errors.present?
        render :new
      else
        redirect_to tasks_path, notice: 'タスクを追加しました'
      end
      # @taskにはエラーの情報を入れているので、それをindexに返した
      # い
    else
      redirect_to tasks_path, notice: 'ファイルがありません。'
    end
  end


  private

  def task_params
    params.require(:task).permit(:name, :description, :image)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
