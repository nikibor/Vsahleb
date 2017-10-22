# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize
  layout 'landing'
  def show; end

  def create
    redirect_to '/'
  end

  def destroy
    session['user_email'] = nil
    redirect_to root_url
  end

  def confirm
    @email = request.env['omniauth.auth'].info.email
    @user = User.find_by(email: @email)
    if !@user.nil?
      session['user_email'] = @email
      return redirect_to '/lines' if @user.role == :admin
    else
      @name = request.env['omniauth.auth'].info.name
      User.create name: @name, email: @email, role: :author
      session['user_email'] = @email
    end
    redirect_to '/studios'
  end
end
