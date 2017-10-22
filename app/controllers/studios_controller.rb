class StudiosController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  layout 'landing'
  def index

    @stories = Story.all
  end

  def show; end

  def new
    @story = Story.new
  end

  def edit; end

  def create
    @title = params[:story][:title]
    @description = params[:story][:description]
    @genre = Genre.find(params[:story][:genre])
    @story = Story.create(title: @title, description: @description, genre: @genre)
    session[:studio] = @story.title
    redirect_to '/lines'
  end

  def update
    @title = params[:story][:title]
    @description = params[:story][:description]
    @genre = Genre.find(params[:story][:genre])
    @story.update(title: @title, description: @description, genre: @genre)
    session[:studio] = @story.id
    redirect_to '/lines'
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :description, :genre)
  end
end
