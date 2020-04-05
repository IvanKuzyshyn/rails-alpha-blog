require "test_helper"

class Api::CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup

  end

  def authorize_user
    User.create(first_name: "Test", last_name: "User", email: "test@user.com", password: "some_password")
    post auth_sign_in_path({ email: "test@user.com", password: "some_password" })
  end

  test "should get categories index with empty array" do
    get api_categories_path

    assert_response :success
    assert_equal [], response.parsed_body
  end

  test "should get category index with created category" do
    category = Category.create(name: "football")

    get api_categories_path

    assert_response :success
    assert_equal [category.as_json], response.parsed_body
  end

  test "should return paginated data" do
    %w[one two three four five six].each { |name| Category.create(name: name) }

    assert_equal Category.all.count, 6

    get api_categories_path

    assert_response :success
    assert_equal response.parsed_body.count, 5

    get api_categories_path, params: { page: 2 }

    assert_response :success
    assert_equal response.parsed_body.count, 1
  end

  test "should get an empty array if page is empty" do
    %w[one two three].each { |name| Category.create(name: name) }

    get api_categories_path, params: { page: 2 }
    assert_response :success
    assert_equal response.parsed_body, []
  end

  test "should create and return category" do
    authorize_user
    post api_categories_path({ name: "football" })

    assert_response :success
    assert_equal Category.find_by(name: "football").as_json, response.parsed_body
  end

  test "should return an error" do
    authorize_user
    post api_categories_path({ name: "football" })
    post api_categories_path({ name: "football" })

    assert_response :unprocessable_entity
  end

  test "should return 401 if user is not authorized" do
    post api_categories_path({ name: "football" })

    assert_response :unauthorized
  end

  test "should show individual category data" do
    authorize_user
    post api_categories_path({ name: "football" })

    get api_category_path(Category.find_by(name: "football"))
    assert_response :success
  end

  test "should return not found is no category found with provided id" do
    # TBD
  end

end
