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
    task = Task.new(task_params)
    task.save!
    # 一覧画面に繊維
    # flash[:notice]にメッセージを付与
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  private

  def task_params
    # Strong Parameters
    # nameとdescrptionのみ抜き取る
    params.require(:task).permit(:name, :description)
  end
end
