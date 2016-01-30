class UsersController < ApplicationController
	access all: [:index], user: [:index, :show], provider: :all
	access [:all, :user] => [:show, :index]
	def new
		@user = User.new
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :phone_number)
		end
end
