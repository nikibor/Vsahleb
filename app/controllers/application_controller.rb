class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user, :sign_in?, :authorize

  def current_user
    @user ||= session['user_email']
  end

  def sign_in?
    !session['user_email'].nil?
  end

  def authorize
    redirect_to '/sessions' unless current_user
  end
end
