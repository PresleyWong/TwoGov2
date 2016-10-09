class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update]

	def show
	end

	private
	def set_user
		@user = User.find(params[:id])
	end
end
