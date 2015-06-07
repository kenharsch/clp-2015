
@posts = Post.all

@posts.each do |post|
	puts "ok1"
	@evals = Evaluation.where(post_id: post.id)
	puts "ok2"
		i = 0 
		g = 0.0
		puts "ok3"
			@evals.each do |eval| 
				puts "ok4"
				temp = (eval.rating_1 + eval.rating_2 + eval.rating_3)/3
				g = g + temp
				i += 1
				puts "ok5"
			end
			puts "ok6"
		g = g/i
		post.update(grade: g)
end