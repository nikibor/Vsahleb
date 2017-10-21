module ApplicationHelper

  def auth_link
    if sign_in?
      link_to('Выйти', '/login', method: :delete)
    else
      link_to('Войти', '/login')
    end
  end

  def auth_message
    if flash[:notice] || !flash[:alert].nil?
      content_tag(:div, flash[:notice], class: 'panel.panel-default.panel-heading')
    end
  end

end
