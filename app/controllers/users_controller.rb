class UsersController < ApplicationController
	access all: [:index], user: [:index, :show], provider: :all
	access [:all, :user] => [:show, :index]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				session[:user_to] = @user.id
				redirect_to account_path(current_user)
			else
				render :new
			end

	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :phone_number)
		end
end
