class SessionController < ApplicationController
  def confirm
    @email = request.env['omniauth.auth'].info.email
    @current_teacher = Teacher.find_by(email: @email)
    if @current_teacher
      session[:current_user_id] = @current_teacher.id
      session[:current_user_type] = :Teacher
      redirect_to @current_teacher
    else
      flash[:notice] = 'Ошибка входа, такого пользователя не существует'
      redirect_to '/login'
    end
  end
  def show
    
  end
end
