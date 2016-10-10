class PagesController < ApplicationController
	def search
    # byebug
  		# times
  		# genders
      # age
  		# persons
	    # search = "#{params[:location]} #{params[:activity]} #{params[:language]} #{params[:time]}"
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
      # @posts.users.where(gender:params[:gender], age:params[:age])
	    @activities_bar = Activity.all
	  	render "posts/index"
	end
end
