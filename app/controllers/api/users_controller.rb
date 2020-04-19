class Api::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    users = User.paginate(page: params[:page], per_page: 5)

    render_json(users)
  end

  def show
    render_json(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render_json(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render_json(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {}, status: :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
