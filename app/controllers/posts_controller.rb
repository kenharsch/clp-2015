class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.admin?
      @posts = Post.all.order(user_nickname: :asc)
      @posts
    else
      @posts = Post.where(:user_id=>current_user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
   # @post = Post.new(:user => @current_user)
  end
end


  # GET /posts/1
  # GET /posts/1.json
  def show
    
    @post = Post.find(params[:id])
    ahoy.track "Visited Post", post_id: @post.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  def new
     @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
 # @post = Post.new(params[:post])
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    ahoy.track "Edited Post", post_id: @post.id
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name 
    @post.user_nickname = current_user.nickname 

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :problemID, :content, :savedOn, :toGroupOn, :togroup, :grade, :grader, :prob, :gid, :discussion, :ta_grade, :draft)
    end
end
