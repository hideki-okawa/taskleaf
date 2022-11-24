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
    @task = Task.new(task_params)
    
    if @task.save
      # taskの登録に成功したとき
      # 一覧画面に遷移
      # flash[:notice]にメッセージを付与
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      # taskの登録に失敗したとき
      # 新規登録画面に戻す
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    # Strong Parameters
    # nameとdescrptionのみ抜き取る
    params.require(:task).permit(:name, :description)
  end
end
