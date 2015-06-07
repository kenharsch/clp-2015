class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_one :membership
  has_one :group, :through => :membership
  has_many :evaluations
  has_many :visits
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name, :nickname, :email, :password, presence: true
	validates :name, uniqueness: true
	validates :nickname, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with:%r{\.(gif|jpg|png)\Z}i,
		message: 'must be url for GIF, JPG or PNG image.'
	}
  

  def delta
    @posts = Post.where(:user_id=>self.id)
    @evaluations = Evaluation.where(user_id: self.id, post_id: (4..23)).order('user_rank ASC')
    
    ordered = true
    rank = 1
    @evaluations.each do |eval|
      if eval.post.ta_rank.nil?
        ordered = false

      elsif eval.post.ta_rank - rank < 0
        ordered = false
        rank = eval.post.ta_rank
      else
        rank = eval.post.ta_rank
      end
    end
    
     delta = 0    

    if ordered == false
      abs_rank = 1
      prev_rank = 1
      @evaluations.each do |evaluation|
        if evaluation.post.ta_rank.nil?
          delta += 0
        elsif evaluation.post.ta_rank == prev_rank 
          delta += 0
        elsif evaluation.post.ta_rank == abs_rank
          delta += 0
        else
          delta += (evaluation.post.ta_rank - abs_rank).abs
        end
        abs_rank += 1
        prev_rank = evaluation.post.ta_rank
      end
    end
    return delta
  end

end
