require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  test "should not save category without name" do
    category = Category.new
    category.description = "description"
    assert_not category.save, "Saved the Category without a description"
  end
  test "should not save category without description" do
    category = Category.new
    category.name = "name"
    assert_not category.save, "Saved the Category without a description"
  end
end
