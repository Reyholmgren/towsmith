class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(sign_up_params)
    if @user.save
      sign_in @user
      if @user.roles == 'provider'
        redirect_to requests_path
      else
        redirect_to providers_path
      end
    else
      render :new
    end
  end

  private

    def sign_up_params
      params.require(:user).permit(:roles, :first_name, :last_name, :phone, :email, :password, :password_confirmation, :tow, :smith)
    end

    def account_update_params
      params.require(:user).permit(:roles, :first_name, :last_name, :phone, :email, :password, :password_confirmation, :current_password, :tow, :smith)
    end
end
