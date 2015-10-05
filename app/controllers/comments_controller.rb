class CommentsController < ApplicationController
	before_action :find_target, only: [:index, :create, :new, :destroy]

  def index
  	@comments = @target.comments.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @target.comments.build
  end

  def edit
		@comment = Comment.find(params[:id])
	end

  def create
    @comment = @target.comments.create(comment_params)

    if @comment.save
      redirect_to @target
    else
      render 'new'
    end
  end

  def update
		@comment = Comment.find(params[:id])

		if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
	end

	def destroy
		@comment = @target.comments.find(params[:id])
    @comment.destroy
 
    redirect_to @comment.target
	end
  
  private
  def find_target
  	if params[:post_id] || params[:video_id] 
  		klass = params[:post_id] ? Post : Video
  	else
  	  klass = Event
  	end
  	par = (klass.to_s.downcase + "_id").to_sym
    @target = klass.find(params[par])
  end 

  def comment_params
    params.require(:comment).permit(:author_name, :author_email, :content)
  end
end