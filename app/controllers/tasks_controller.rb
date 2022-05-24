class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @new_task = Task.new
  end

  def create
    @create_task = Task.new(task_params)
    @create_task.save
    redirect_to task_path(@create_task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @edit_task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
