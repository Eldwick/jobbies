class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def edit
  end

  def update
    @task.update(tasks_params)

    if params[:commit] == "Complete and New"
      @task.update(pending: false)
      @application = Application.find(params[:task][:application_id])
      @task = Task.new
      redirect_to new_task_path(params[:task][:application_id])
    elsif params[:commit] == "Complete"
      @task.update(pending: false)
      redirect_to application_path(params[:task][:application_id])
    elsif params[:commit] == "Revert to Pending"
      @task.update(pending: true)
      redirect_to application_path(params[:task][:application_id])
    elsif params[:commit] == "Edit"
      redirect_to task_path(params[:id])
    end

  end

  def new
    @application = Application.find(params[:application_id])
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to application_path(params[:task][:application_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:subject, :due_date, :notes_before, :notes_after, :application_id, :contact_id)
  end

end
