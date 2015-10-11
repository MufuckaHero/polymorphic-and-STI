class TagsController < ApplicationController
  before_action :find_tag, only: [:show]

  def new
    @tag = Tag.new
  end
  
  def show
    @articles = ContentView.any_tags(@tag.id)
  end

  def create
    @tag = Tag.create(tag_params)

    if @tag.save
      redirect_to :root, notice: "Tag Saved"
    else 
      render 'new'
    end
  end

  protected
  def find_tag
    @tag = Tag.where(name: params[:id]).first
  end

  private
  def tag_params
    params.require(:tag).permit(:name, :slug)
  end
end