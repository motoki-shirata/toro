class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = params[:post_id]

		if @comment.save
			redirect_to(@post)
		else
			redirect_to(@post)
		end
	end

  def destroy
    @comment.destroy
    redirect_to @post
  end


	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def correct_user
		@comment = current_user.comments.find_by(post_id: params[:post_id], id: params[:id])
		@post = Post.find(params[:post_id])
		unless @comment
			redirect_to @post
		end
	end
end
