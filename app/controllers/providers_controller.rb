class ProvidersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @requests = Request.all.where(user_id: current_user)
  end
end
