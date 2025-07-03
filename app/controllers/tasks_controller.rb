class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks

    if params[:year].present? && params[:month].present?
      begin
        start_date = Date.new(params[:year].to_i, params[:month].to_i)
        end_date = start_date.end_of_month
        @tasks = @tasks.where(created_at: start_date..end_date)
      rescue ArgumentError
        flash.now[:alert] = "Invalid year/month combination"
        @tasks = Task.none
      end
    elsif params[:year].present?
      @tasks = @tasks.where("EXTRACT(YEAR FROM created_at) = ?", params[:year].to_i)
    elsif params[:month].present?
      @tasks = @tasks.where("EXTRACT(MONTH FROM created_at) = ?", params[:month].to_i)
    end

    case params[:filter]
    when "completed"
      @tasks = @tasks.where(completed: true)
    when "pending"
      @tasks = @tasks.where(completed: false)
    end
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
