class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

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

    @story = Story.new(title: @title, description: @description, genre: @genre)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @title = params[:story][:title]
    @description = params[:story][:description]
    @genre = Genre.find(params[:story][:genre])

    respond_to do |format|
      if @story.update(title: @title, description: @description, genre: @genre)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
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
