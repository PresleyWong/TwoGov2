class ReviewsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.find(params[:user_id])
		@review = Review.new
	end

	def edit
	end

	def show

	end

	def index
		@posts = Review.all	
	end

	def create
      @review = current_user.reviews.build(review_params)
      @review.post_id = params[:poster_id]

      byebug

      if @review.save
	  	flash[:notice] = "Review is created successfully."
	    redirect_to @review
	  else
	  	flash[:alert] = "Error creating review."
	    render 'new'
	  end
	end

	def update 
	  if @review.update(review_params)
	  	flash[:notice] = "Review is updated successfully."     
	    redirect_to @review
	  else
	    render 'edit'
	  end
	end

	def destroy
		Review.destroy(@review.id)
		flash[:notice] = "Review is deleted."
		redirect_to root_path
	end


	private
	def set_review
		@review = Review.find(params[:id])
	end

	def review_params
		params.require(:review).permit(:content)  
	end
end
