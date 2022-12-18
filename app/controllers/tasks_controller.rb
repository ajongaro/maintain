class TasksController < ApplicationController
  def index
    @task = Task.all.first
    redirect_to "/tasks/#{@task.id}"
  end

  def show
    @task = Task.find(params[:id])
  end
end