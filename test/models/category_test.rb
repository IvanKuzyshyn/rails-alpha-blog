require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "football")
  end

  test "record is valid" do
    assert @category.valid?
  end

  test "name is required" do
    @category.name = " "

    assert_not @category.valid?
  end

  test "name is unique" do
    @category.save
    category2 = Category.new(name: "football")

    assert_not category2.valid?
  end

  test "name is not too long" do
    @category.name = "Some very-very long name for the category, Some very-very long name for the category, Some very-very long name for the category, Some very-very long name for the category"

    assert_not @category.valid?
  end

  test "name is not too short" do
    @category.name = "s"

    assert_not @category.valid?
  end

end
