class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authorize
  # helper_method :current_user, :sign_in?, :authorize

  # def current_user
  #   @user = session[:email]
  #   @current_user ||= @user
  # end
  #
  # def sign_in?
  #   !session[:current_user_id].nil?
  # end
  #
  # def authorize
  #   redirect_to root_url unless current_user
  # end
end
