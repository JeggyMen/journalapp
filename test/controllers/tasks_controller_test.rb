require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
    # test "the truth" do
    #   assert true
    # end

    setup do
      @category = categories(:one)
      @task = tasks(:one)
    end

    test "should get index" do
      get category_tasks_path(@category)
      assert_response :success
    end

    test "should get new" do
      get new_category_task_path(@category)
      assert_response :success
    end

    test "should create task for a specific category" do
      assert_difference("Task.count") do
        post category_tasks_path(@category), params: {task: { body: "New task is added."}}
    end
      assert_redirected_to category_task_path(@category, Task.last)
    end

    test "should get edit" do
      get edit_category_task_path(@category, @task)
      assert_response :success
    end

    test "should show task" do
      get category_task_path(@category, @task) 
      assert_response :success
    end

    test "should update task" do
      patch category_task_path(@category, @task), params: {task: {title: @task.title, description: @task.description, due_date: @task.due_date, done: @task.done}}
      assert_redirected_to category_task_path(@category, @task)
    end

 
    test "should destroy task for a specific category" do
      assert_difference("Task.count", -1) do
        delete category_task_path(@category, @task)
      end
  
      assert_redirected_to category_path(@category)
    end

    test ""
end