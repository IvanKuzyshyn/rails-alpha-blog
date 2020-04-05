class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def render_json(data)
    render json: data
  end

  def signed_in?
    !session[:user_id].nil?
  end
end
