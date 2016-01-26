class RequestsController < ApplicationController
  def index
    @requests = Request.all.order(created_at: :desc)
  end

  def create
    @request = Request.new(request_params)
    if @request.save
    	# redirect_to << work on path
    else
    render :request
  	end
  end

  def new
  	@request = Request.new(user_id: params[:user_id])
  end

  def show
  	@request = Request.find(params[:id])

  end

  private
    def request_params
      params.require(:request).permit(:title, :info)
    end
end
