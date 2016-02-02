class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_first_name(params[:first_name])
		if @user && @user.authenticate(params[:password]) 
			session[:user_id] = @user.user_id
			redirect_to account_path(current_user)
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
