class ProvidersController < ApplicationController
  def index
    @requests = Request.all.where(user_id: current_user)
  end
end
