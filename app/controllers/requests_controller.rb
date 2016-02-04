class RequestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @customer_requests = Request.where(provider_id: current_user.id)
    @requests = Request.where(user_id: current_user.id)
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
    respond_to do |format|
      if @request.update(request_params)
        format.html {redirect_to requests_path}
        format.json {render json: @request}
      else
        format.html {render :edit}
        format.json {render json: @request.errors.full_message.join(',')}
      end
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
      params.require(:request).permit(:title, :info, :phone, :user_id, :provider_id, :make, :model, :model_year, :roles, :completed, :accepted, :first_name, :last_name)
    end

end
