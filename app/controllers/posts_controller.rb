class PostsController < ApplicationController
	def index
		@posts = Post.order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])	
	  @comments = @post.comments.all
	end

	def new
		@post = Post.new
		@post.build_picture
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.create(post_params)

		if @post.save
      redirect_to @post, notice: "Successfully saved"
    else
      render 'new'
    end
	end

	def update
		@post = Post.find(params[:id])

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
  def post_params
    params.require(:post).permit(:title, :content, picture_attributes: [:data])
  end
end