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
end
