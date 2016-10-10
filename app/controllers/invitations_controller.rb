class InvitationsController < ApplicationController
	# include UsersHelper
	def index
		@posts = Post.where(user_id: current_user.id)
		@invitations = Invitation.where("user_id = #{current_user.id} or invitee_id=#{current_user.id}")
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
    		@poster = User.find(@post.user.id)
    		@guest = current_user
    		RequestMailer.request_email(@poster, @guest, @post).deliver_later
    		redirect_to posts_path
    	else
    		flash[:alert] = "Error creating request"
    		redirect_to posts_path
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
