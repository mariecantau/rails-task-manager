class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # créer un strong params avec create et update
    # pas de view
    # redirect
    # @task = Task.new(params[:task])
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # créer un strong params avec create et update
    # pas de view
    # redirect
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # redirect
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


private

# strong param, autorise uniquement title, details, completed
def task_params
  params.require(:task).permit(:title, :details, :completed)
end
end
