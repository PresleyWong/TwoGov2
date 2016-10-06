class PagesController < ApplicationController
	def search
  	# place in postings controller?
	    search = "#{params[:location]} #{params[:activity]}"
	    @posts = Post.search_by_columns(search)
	  	render "posts/index"
	end
end
