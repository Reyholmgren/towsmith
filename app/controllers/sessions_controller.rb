class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_first_name(params[:first_name])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.user_id
			if @user.roles == 'provider'
				redirect_to providers_path
			else
				redirect_to requests_path
			end
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
