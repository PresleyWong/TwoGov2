class PagesController < ApplicationController
	def search
      # age
  		# persons
      @posts = Post.all
        if !params[:location].nil?
	       @posts = Post.search_by_location(params[:location])
        end
        # byebug
        if !params[:activity].nil?
          activities = params[:activity].join(" ")
          @posts = @posts.search_any_activities(activities)
        end
        # byebug
        if !params[:language].nil?
          languages = params[:language].join(" ")
          @posts = @posts.search_any_languages(languages)
        end
        # byebug
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
      @posts.order('created_at DESC')
	    @activities_bar = Activity.all
	  	render "posts/index"
	end
end
