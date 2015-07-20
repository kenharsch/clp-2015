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
      params.require(:comment).permit(:commenter, :body, :user_id, :crit_low_1 ,:crit_med_1, :crit_high_1,
            :crit_low_2,:crit_med_2, :crit_high_2, :interaction_independent, :interaction_quasi_int, :elaborative, :negotiating)
    end
end
