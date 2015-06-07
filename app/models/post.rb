class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :evaluations

	validates :problemID, presence: { :message => "You must choose an assignment tag."}



	def peer_grade
		@evals = Evaluation.where(post_id: self.id, user_id: [11, 43, 13, 35, 101, 86, 121, 127, 76, 68, 99,
					30, 128, 72, 45, 25, 48, 24, 70, 107, 80, 59, 10, 89, 55, 111, 83, 74, 21, 23, 95, 46, 71, 
					90, 100, 27, 81, 79, 122, 78, 116, 17, 65, 46, 47, 52])
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				temp = 0
				unless eval.rating_2.nil?
					unless eval.rating_3.nil?
						unless eval.rating_1.nil?
							temp = (eval.rating_1 + eval.rating_2 + eval.rating_3)/3
						end
					end
				end
				grade = grade + temp
				i += 1
			end
		grade = grade/i
	end

	def pg_1
		@evals = Evaluation.where(post_id: self.id, user_id: [76, 72, 41, 27, 100, 11, 74, 10, 47, 106, 89,49, 
					106, 89, 49, 109, 127, 48, 61, 73, 90, 35, 101, 83, 58, 78, 14, 87, 93, 94, 131, 96, 50])
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_1.nil?
					grade = grade + eval.rating_1
					i += 1
				end
			end
		grade = grade/i
	end

	def pg_2
		@evals = Evaluation.where(post_id: self.id, user_id: [76, 72, 41, 27, 100, 11, 74, 10, 47, 106, 89,49, 
					106, 89, 49, 109, 127, 48, 61, 73, 90, 35, 101, 83, 58, 78, 14, 87, 93, 94, 131, 96, 50])
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_2.nil?
					grade = grade + eval.rating_2
					i += 1
				end
			end
		grade = grade/i
	end

	def pg_3
		@evals = Evaluation.where(post_id: self.id, user_id: [76, 72, 41, 27, 100, 11, 74, 10, 47, 106, 89,49, 
					106, 89, 49, 109, 127, 48, 61, 73, 90, 35, 101, 83, 58, 78, 14, 87, 93, 94, 131, 96, 50])
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_3.nil?
					grade = grade + eval.rating_3
					i += 1
				end
			end
		grade = grade/i
	end

	def avg_rank
		@eval = Evaluation.where(post_id: self.id)
		rank = 1
		i = 1
		@eval.each do |e|
			unless e.user_rank.nil?
			rank += e.user_rank
			i += 1
			end
		end
		return rank/i
	end

end











