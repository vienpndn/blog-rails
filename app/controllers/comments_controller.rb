class CommentsController < ApplicationController
	def index
	end
	def show
	end
	def create
		@post = Post.find(params[:post_id])
		if @comment = @post.comments.create(comment_params)
			render "posts/show"
		else
			redirect_to @post
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end


	private def comment_params
		params.require(:comment).permit(:user, :content)
	end

end
