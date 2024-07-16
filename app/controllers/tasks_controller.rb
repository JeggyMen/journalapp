class TasksController < ApplicationController
   
   def index
     @tasks = @category.tasks
   end
   
   def new
     @tasks = @category.tasks.build
   end

   def create
     @tasks = @category.tasks.build(task_params)

     if @task.save
        redirect_to category_task_path(@category, @task), notice: 'Succesfully created new task.'
     else
        render :new, status: :unprocessable_entity
     end
   end

end
