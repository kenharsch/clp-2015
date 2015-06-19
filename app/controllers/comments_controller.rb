class CommentsController < ApplicationController

	 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  	end
 
  	def update
  		@comment.update(comment_params)
  	end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, :shallow, :grammatical, :challenge, :quote, :reply, :author, :analytical)
    end
end
