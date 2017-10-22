class HomeController < ApplicationController
  skip_before_action :authorize
  layout 'landing'
  def index

  end

  def arts

  end

  def raiting

  end

end
