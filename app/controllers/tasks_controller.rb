class TasksController < ApplicationController
  def index
    @task = Task.all.first
    redirect_to "/tasks/#{@task.id}"
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    task = Task.new(task_params)
    if task.save
      redirect_to "/tasks/#{task.id}"
    else
      flash[:alert] = "Task not created" 
    end
  end

  private
  def task_params
    params.permit(
      :title,
      :description,
      :location,
      :priority,
      :category,
      :time_commitment,
      :frequency)
  end
end