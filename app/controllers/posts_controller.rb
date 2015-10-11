class PostsController < ApplicationController
  before_action :tags_all, only: [:new, :edit]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])  
    @comments = @post.comments.all
    @post_tags = Tag.where(id: @post.tag_ids)
  end

  def new
    @post = Post.new
    @post.build_picture
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.picture
      @post.build_picture
    end
  end

  def create
    @post = Post.create(post_params)
    @post.tag_ids = params[:tag_ids]

    if @post.save
      redirect_to @post, notice: "Successfully saved"
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.tag_ids = params[:tag_ids] 

    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end

  private
  def tags_all
    @tags = Tag.all
  end

  def post_params
    params.require(:post).permit(:title, :content, picture_attributes: [:data])
  end
end