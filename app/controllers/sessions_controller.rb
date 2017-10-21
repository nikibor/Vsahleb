class SessionsController < ApplicationController

  skip_before_action :authorize
  def show

  end

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
    if @user
      session['user_email'] = @email
      return redirect_to '/admin' if @user.role == :admin
    else
      @name = request.env['omniauth.auth'].info.name
      User.create name: @name, email: @email, role: :author
      session['user_email'] = @email
    end
    redirect_to '/'
  end
end
