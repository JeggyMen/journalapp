require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    setup do
        @category_params = { category: { name: 'Work', description: 'Tasks related to work' } }
      end
    
    test "should create category" do
        assert_difference('Category.count') do
            post categories_url, params: { category: { task_name: @category.category_name, description: @category.description}}
        end

        assert_redirected_to category_url(Category.last)
        assert_equal 'Category was successfully created.', flash[:notice]
    end
    
    test "should not create category with invalid params" do
        @invalid_category_params = { category: { name: '', description: '' } }
    
        assert_no_difference('Category.count') do
          post categories_url, params: @invalid_category_params
        end
    
        assert_response :unprocessable_entity
      end
end
 