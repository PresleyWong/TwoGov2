class PagesController < ApplicationController
	def search
    if !params[:activity].nil?
      activities = params[:activity].join(" ")
    end
    if !params[:language].nil?
      languages = params[:language].join(" ")
    end
    if !params[:time].nil?
      times = params[:time].join(" ")
    end
	    search = "#{params[:location]} #{activities} #{languages} #{times}"
      if search == "   "
       @posts = Post.all
      else
	     @posts = Post.search_by_columns(search)
	    end
      # @posts.users.where(gender:params[:gender], age:params[:age])
	    @activities_bar = Activity.all
	  	render "posts/index"
	end
end
