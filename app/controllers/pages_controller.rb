class PagesController < ApplicationController
	def search
  	if !params[:activity].nil?
  		activities = params[:activity].values.join(" ")
  	end
  	if !params[:language].nil?
  		languages = params[:language].values.join(" ")
  	end
  	if !params[:duration].nil?
  		durations = params[:duration].values.join(" ")
  	end
  		# times
  		# genders
  		# age
  		# persons
	    search = "#{params[:location]} #{activities} #{languages} #{durations}"
      byebug
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
