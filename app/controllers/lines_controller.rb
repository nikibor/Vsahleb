class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]
  def index
    @lines = Line.all
  end
end
