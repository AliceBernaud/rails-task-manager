class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to task_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path, status: :see_other
  end

  private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end
end
