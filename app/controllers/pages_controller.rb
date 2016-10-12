class PagesController < ApplicationController
	def search
      # age
  		# persons
      @posts = Post.all.includes(:user).order(created_at: :desc)
        if !params[:location] != ""
	       @posts = Post.search_by_location(params[:location])
        end
        if !params[:activity].nil?
          activities = params[:activity].join(" ")
          @posts = @posts.search_any_activities(activities)
        end
        if !params[:language].nil?
          languages = params[:language].join(" ")
          @posts = @posts.search_any_languages(languages)
        end
        if !params[:time].nil?
          times = params[:time].join(" ")
          @posts = @posts.search_any_times(times)
        end
        if !params[:gender].nil?
          users = []
          @posts.each do |post|
            if !users.include?post.user_id
              users << post.user_id
            end
          end
          gender_users = User.where(id: users, gender: params[:gender].downcase).ids
          @posts = @posts.where(user_id:gender_users)
        end

        confirmed = Invitation.where(status:1)
        post_ids = @posts.ids
        confirmed.each do |invite|
          if post_ids.include?invite.post_id
            post_ids.delete(invite.post_id)
          end
        end
        @posts = @posts.where(id:post_ids)

	    @activities_bar = Activity.all
	  	render "posts/index"
	end
end
