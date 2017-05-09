class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy, :update, :mark_as_done]

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def update
    @task.update(tasks_params)
    if @task.save
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def mark_as_done
    if @task.done
      @task.done = false
    else
      @task.done = true
    end
    @task.save
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:description, :done)
  end
end
