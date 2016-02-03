class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @requests = Request.all.where(user_id: current_user.id)
    @providers = User.where(roles: 'provider')
    @customer_requests = Request.where(provider_id: current_user.id)
  end

  def new
    @request = Request.new(user_id: params[:user_id])
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path, notice: "Your request was saved"
    else
      flash[:alert] = "Error! Failed to create a new request! Please try again."
      redirect_to root_path
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path
  end


  private
    def request_params
      params.require(:request).permit(:title, :info, :user_id, :provider_id)
    end

end
