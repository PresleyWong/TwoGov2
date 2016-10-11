class PagesController < ApplicationController
	def search
    start = Time.now
    # if !params[:activity].nil?
    #   activities = params[:activity].join(" ")
    # end
    # if !params[:language].nil?
    #   languages = params[:language].join(" ")
    # end
    # if !params[:time].nil?
    #   times = params[:time].join(" ")
    # end
    @posts = Post.all
    params[:activity].each do |activity|
	   @posts += Post.search_by_activities(activity)
    end
      # @posts.users.where(gender:params[:gender], age:params[:age])
	    @activities_bar = Activity.all
          end_time = Time.now
      @time = end_time - start
	  	render "posts/index"
	end
end
