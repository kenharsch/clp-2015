class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_one :membership
  has_one :group, :through => :membership
  has_many :evaluations
  has_many :visits
  has_many :comments

  accepts_nested_attributes_for :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :name, :nickname, :email, :password, presence: true
	validates :name, uniqueness: true
	validates :nickname, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with:%r{\.(gif|jpg|png)\Z}i,
		message: 'must be url for GIF, JPG or PNG image.'
	}
  

  def delta (problem)
    @posts = Post.where(problemID: problem)
    @evaluations = Evaluation.where(user_id: self.id, :post_id => @posts).order('user_rank ASC')
    delta = 0
    @evaluations.each do |e1|
      @evaluations.each do |e2|
        unless e1.user_rank.nil? or e2.user_rank.nil?
        if e1.user_rank < e2.user_rank
          unless e1.post.ta_rank.nil? or e2.post.ta_rank.nil?
          if e1.post.ta_rank > e2.post.ta_rank
            delta += 1
          end
        end
        end
      end
      end
    end
    return delta
  end

end
