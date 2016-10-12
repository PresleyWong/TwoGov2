class PostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	respond_to :html, :js

	include UsersHelper
	include TimeHelper

	def new
		@post = Post.new
	end

	def edit
	end

	def show

	end

	def index
		@posts = Post.all.order('updated_at DESC')
		@activities_bar = Activity.all
		# @confirmed_request = Invitation.where(status: 1)
		# @posts.each do |post|
		# 	post.invitations
	end

	def create
      @post = current_user.posts.build(post_params)

      if is_current_user_has_complete_profile && @post.save
	  	flash[:notice] = "Post is created successfully."
	    redirect_to @post
	  else
	  	flash[:alert] = "Error creating post."
	    flash[:alert] << " Missing gender or date of birth detail in user profile" if is_current_user_has_complete_profile == false

	    render 'new'
	  end
	end

	def update 
	  if @post.update(post_params)
	  	flash[:notice] = "Post is updated successfully."     
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
		Post.destroy(@post.id)
		flash[:notice] = "Post is deleted."
		redirect_to root_path
	end

	def listing
	    @listings = Post.where(user_id: current_user.id)

	    render 'listing.html.erb'
  	end


	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:address, :description, :duration_type, :activity_type, :language_type, :search_tag, :title, :gender)  
	end
end



