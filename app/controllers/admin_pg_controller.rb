class AdminPgController < ApplicationController
  def index
  	@users = User.all.order(:nickname)
  	@posts = Post.all 
  	@comments = Comment.all
  	@events = ::Ahoy::Event.all
  end

  def admin2
  	@users = User.all.order(:nickname)
  	@posts = Post.where(problemID: 1) 
  	@comments = Comment.all
  	@events = ::Ahoy::Event.all
  	@evaluations = Evaluation.all.order(:post_id)
  end

  def group_pg
    @groups = Group.all 
    
  end

end
