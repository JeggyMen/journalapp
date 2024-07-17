class TasksController < ApplicationController
  before_action :get_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

   def index
     @tasks = @category.tasks
   end
   
   def new
     @category = Category.find(params[:category_id])
     @task = @category.tasks.build
   end

   def create
     @task = @category.tasks.build(tasks_params)
     if @task.save
        redirect_to category_tasks_path(@category, @task), notice: 'Successfully created new task.'
     else
        render :new, status: :unprocessable_entity
    end
   end

   def show
      @task = Task.find(params[:id])
   end

   def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
   end

   def update
    if @task.update(tasks_params)
      redirect_to category_task_path(@category, @task), notice: 'Successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
   end

   def destroy
    @task.destroy
    redirect_to category_tasks_path(@category), notice: 'Successfully deleted the task.'
   end

   private

   def get_category
     @category = Category.find(params[:category_id])
   end

   def set_task
    @task = @category.tasks.find(params[:id])
   end

   def tasks_params
      params.require(:task).permit(:body, :category_id)
   end
end
