class User < ActiveRecord::Base
  ################################################################################ 
  ## PeterGate Roles
  ## The :user role is added by default and shouldn't be included in this list.
  petergate(roles: [:user, :provider])
  # user_signed_in?
  # current_user
  # after_sign_in_path_For(current_user)
  # authenticate_user!
  ################################################################################
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :phone
  has_many :requests
end