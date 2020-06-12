class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = params[:post_id]
		@post = Post.find_by(params[:post_id])

		if @comment.save
			redirect_to(@post)
		else
			redirect_to(@post)
		end
	end

private

def comment_params
	params.require(:comment).permit(:content)
end

end
