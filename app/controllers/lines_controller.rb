# frozen_string_literal: true

class LinesController < ApplicationController
  # before_action :set_line, only: [:show, :edit, :update, :destroy]
  def index
    flash[:notice] = current_project
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

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      render json: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  private

  def line_params
    params.require(:line).permit(:speaker, :message)
  end

  def studio
    if !session['studio'].nil?
      @studio = Story.find(session['studio'])
    else
      redirect_to root_url
    end
  end
end
