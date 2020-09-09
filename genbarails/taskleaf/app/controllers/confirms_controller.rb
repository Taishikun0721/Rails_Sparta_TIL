class ConfirmsController < ApplicationController
  before_action :set_task, only: :update

  def create
    @confirm_task = current_user.tasks.new(task_params)
    render :new unless @confirm_task.valid?
  end

  def update
    @confirm_task.assign_attributes(task_params)
    render :edit unless @confirm_task.valid?
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :image)
  end

  def set_task
    @confirm_task = current_user.tasks.find(params[:task][:id])
  end

end
