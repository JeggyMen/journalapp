class TasksController < ApplicationController
  before_action :get_category

   def index
     @tasks = @category.tasks
   end
   
   def new
     @task = @category.tasks.build
   end

   def create
     @task = @category.tasks.build(tasks_params)
     if @task.save
        redirect_to category_tasks_path(@category, @task)
     else
        render :new
     end
   end

   def show
      @task = Task.find(params[:id])
   end

   private

   def get_category
     @category = Category.find(params[:category_id])
   end
   
   def tasks_params
      params.require(:task).permit(:body, :category_id)
   end
end
