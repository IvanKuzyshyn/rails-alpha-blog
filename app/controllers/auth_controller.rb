class AuthController < ApplicationController
  def sign_in
    email = sign_in_params[:email].downcase
    password = sign_in_params[:password]
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      render_json(user)
    else
      render json: {}, status: :not_found
    end
  end

  def sign_out
    session[:user_id] = nil
    render json: {}, status: :no_content
  end

  def sign_up
  end

  private

  def sign_in_params
    params.permit(:email, :password)
  end
end
