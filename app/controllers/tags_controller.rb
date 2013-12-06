class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, notice: "Tag successfully created"
    end

  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path, notice: "Tag successfully created."
    else
      render "new"
    end
  end

  def destroy
    @tag= Tag.find(params[:id])
    @tag.destroy
    if @tag.destroy
      redirect_to tags_path
    end

 end
private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
