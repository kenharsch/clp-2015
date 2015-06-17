class Group < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships
	has_many :comments, :through => :users

	def gp_comments
		gc = 0
		@users = self.users
		@users.each do |u|
			gc += u.comments.count
			end
		return gc
	end

	def gp_visits
		gv = 0
		@users = self.users
		@users.each do |u|
			gv += ::Ahoy::Event.where(user_id: u.id, name: "Visited Post").count - 
					::Ahoy::Event.where(user_id: u.id, name: "Edited Post").count
		end
		return gv
	end

	def gp_edits
		ge = 0
		@users = self.users
		@users.each do |u|
			ge += ::Ahoy::Event.where(user_id: u.id, name: "Edited Post").count
		end
		return ge
	end

	def gp_comments_work_phase_1
		gcw = 0
		@users = self.users
		@users.each do |u|
			gcw += u.comments.where("created_at >= '2015-02-24 00:00:00' AND created_at <= '2015-03-03 23:59:59'").count
			end
		return gcw
	end

	def gp_words_per_comment_1
		@comments = Array.new
		@users = self.users
		@users.each do |u|
			@temp = u.comments.where("created_at >= '2015-02-24 00:00:00' AND created_at <= '2015-03-03 23:59:59'")
			@temp.each do |c|
				@comments << c
			end
		end
		words = 1
		i = 1
		@comments.each do |comment|
			words += comment.body.split.size
			i += 1
		end
	
		return words/i
	end

	def gp_comment_time_before_due_1
		@users = self.users
		@users.each do |user|
			@temp = user.comments.where("created_at >= '2015-02-24 00:00:00' AND created_at <= '2015-03-03 23:59:59'")
			@temp.each do |c|
				@comments << c
			end
		end
		time = 0
		@comments.each do |comment|
			due = DateTime.new(2015, 3, 3, 23, 59, 59)
			time += (due.to_i - comment.created_at.to_i)/60
		end
		return time/@comments.count
	end

	def gp_comments_work_phase_2
		gcw = 0
		@users = self.users
		@users.each do |u|
			gcw += u.comments.where("created_at >= '2015-04-14 00:00:00' AND created_at <= '2015-04-21 23:59:59'").count
			end
		return gcw
	end

	def gp_words_per_comment_2
		@comments = Array.new
		@users = self.users
		@users.each do |u|
			@temp = u.comments.where("created_at >= '2015-04-14 00:00:00' AND created_at <= '2015-04-21 23:59:59'")
			@temp.each do |c|
				@comments << c
			end
		end
		words = 1
		i = 1
		@comments.each do |comment|
			words += comment.body.split.size
			i += 1
		end
		return words/i
	end

	def gp_comment_time_before_due_2
		@users = self.users
		@users.each do |user|
			@temp = user.comments.where("created_at >= '2015-04-14 00:00:00' AND created_at <= '2015-04-21 23:59:59'")
			@temp.each do |c|
				@comments << c
			end
		end
		time = 0
		@comments.each do |comment|
			due = DateTime.new(2015, 4, 21, 23, 59, 59)
			time += (due.to_i - comment.created_at.to_i)/60
		end
		return time/@comments.count
	end

end
