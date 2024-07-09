require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    
    test "should create category" do
        assert_difference('Category.count') do
            post categories_url, params: { category: { task_name: @category.category_name, description: @category.description}}
        end

        assert_redirected_to category_url(Category.last)
    end
end
