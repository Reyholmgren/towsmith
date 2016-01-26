class DashboardController < ApplicationController
  def index
  end

  def create
    @request= current_user.requests.create(request_params)
    render 'request'
  end

  private
    def request_params
      params.require(:request).permit(:info)
    end
end
