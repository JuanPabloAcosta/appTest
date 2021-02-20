class TasksController < ApplicationController
  has_scope :search
  #before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @pagy, @tasks = pagy(apply_scopes(current_user.tasks), items: 5)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    @task.user_id = current_user.id
    @task.save
    if @task.valid?
      redirect_to tasks_path
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to new_task_path
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description)
    end
end
