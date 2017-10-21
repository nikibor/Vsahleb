module ApplicationHelper

  def auth_link
    if sign_in?
      link_to('Выйти', '/sessions', method: :delete, class: 'navbar-brand')
    else
      link_to('Войти', '/sessions', class: 'navbar-brand')
    end
  end

  # def auth_message
  #   if flash[:notice] || !flash[:alert].nil?
  #     content_tag(:div, flash[:notice], class: 'panel.panel-default.panel-heading')
  #   end
  # end

end
