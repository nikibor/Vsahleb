class LinesController < ApplicationController
  # before_action :set_line, only: [:show, :edit, :update, :destroy]
  def index
    @lines = Line.all
  end

  def create
    @line = Line.new(line_params)
    @line.story = Story.last
    if @line.save
      render json: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    head :no_content
  end

  private

  def line_params
    params.require(:line).permit(:speaker, :message)
  end

  def studio?
    @studio = Story.find(session[:studio])
    if (@studio != nil) then
      return true
    else
      false
    end
  end
end
