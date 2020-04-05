class Api::CategoriesController < ApplicationController
  before_action :require_signed_user, except: [:index, :show]
  before_action :set_category, only: [:show]

  def index
    categories = Category.paginate(page: params[:page], per_page: 5)

    render_json(categories)
  end

  def create
    category = Category.new(category_params)

    if category.save
      render_json(category)
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def show
    render_json(@category)
  end

  private

  def category_params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_signed_user
    render json: {}, status: :unauthorized unless signed_in?
  end

end
