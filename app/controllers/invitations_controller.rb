class InvitationsController < ApplicationController
	def index
	end

	def new
	end

	def create
		@post = Post.find(params[:post_id])
    	@invitation = @post.invitations.new

    	@invitation.user_id = current_user.id
    	@invitation.status = 0 
    	@invitation.invitee_id = @post.user.id

    	if @invitation.save
    		redirect_to posts_path
    	else
    		flash[:alert] = "Error creating request"
    		render "/posts/index"
    	end


	end

	def show
	end

	def destroy
	end

	private

	def invitation_params
		params.require(:invitation).permit(:status, :user_id, :invitee_id, :post_id)

	end
end
