class PostsController < ApplicationController
  before_action :tags_all, only: [:new, :edit]

  def index
    @posts = Post.all.page params[:page]
  end

  def show
    @post = Post.find(params[:id])  
    @comments = @post.comments.all
    @post_tags = Tag.where(id: @post.tag_ids)
    respond_to do |format|
      format.html
      format.pdf do
        render template: "posts/show_pdf.html.haml",
               pdf: "report",
               layout: "pdf.html.haml"
      end
    end
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
      @post.build_picture
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.tag_ids = params[:tag_ids] if params[:tag_ids]

    if @post.update(params)
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