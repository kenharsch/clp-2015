class CommentsController < ApplicationController

	 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  	end
 
  	def update
  		@comment = Comment.find(params[:id])
  		@comment.update(comment_params)
  	end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, :shallow, :grammatical, :challenge, :quote, :reply, :author, :analytical, :crit_low,
      									:crit_med, :crit_high, :interaction_independent, :interaction_quasi_int, :elaborative, :negotiating, :actv,
      									 :exrtv, :imrtv, :egintv, :inctv)
    end
end
