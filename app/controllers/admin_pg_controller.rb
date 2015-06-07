class AdminPgController < ApplicationController
  def index
  	@users = User.all.order(:nickname)
  	@posts = Post.all 
  	@comments = Comment.all
  	@events = ::Ahoy::Event.all
  end

  def admin2
  	@users = User.all.order(:nickname)
  	@posts = Post.all 
  	@comments = Comment.all
  	@events = ::Ahoy::Event.all
  	@evaluations = Evaluation.all.order(:post_id)
		
  end

end
