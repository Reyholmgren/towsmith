class RequestsController < ApplicationController
  access all: [:index, :show, :new, :create, :destroy], user: [:index, :show, :new, :create, :destroy], provider: :all
  def index
    @requests = Request.all.where(user_id: current_user)
    if current_user.available_roles.include? :user
      @request = Request.all.where(user_id: current_user)
    else
      @request = Request.all
    end
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
      params.require(:request).permit(:title, :info, :phone)
    end

end
