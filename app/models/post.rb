class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :evaluations

	validates :problemID, presence: { :message => "You must choose an assignment tag."}



	def peer_grade
		((self.pg_1 + self.pg_2 + self.pg_3) / 3).round(2)
	end

	def pg_1
		@evals = Evaluation.where(post_id: self.id)
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_1.nil?
					grade = grade + eval.rating_1
					i += 1
				end
			end
		grade = (grade/i).round(2)
	end

	def pg_2
		@evals = Evaluation.where(post_id: self.id)
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_2.nil?
					grade = grade + eval.rating_2
					i += 1
				end
			end
		grade = (grade/i).round(2)
	end

	def pg_3
		@evals = Evaluation.where(post_id: self.id)
		i = 0 
		grade = 0.0
			@evals.each do |eval|
				unless eval.rating_3.nil?
					grade = grade + eval.rating_3
					i += 1
				end
			end
		grade = (grade/i).round(2)
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
		return (rank/i).round(2)
	end

	def draft_length
		draft = strip_html_tags(self.draft.to_s)
		return draft.split.size
	end

	def final_length
		final = strip_html_tags(self.content.to_s)
		return final.split.size
	end

	def delta_words
		if self.draft.nil?
			return 0
		elsif self.content.nil?
			return 0
		else
			return self.final_length - self.draft_length
		end
	end

	def strip_html_tags(string)
    	ActionView::Base.full_sanitizer.sanitize(string)
	end

end











