class RequestsController < ApplicationController
  access all: [:index], user: [:index, :show], provider: :all

  def index
<<<<<<< d3e699481ff954f4d81ea9d49da9da831552ec42
    @requests = Request.all.where(user_id: current_user)
=======
    @requests = Request.all.order('created_at DESC')
>>>>>>> added petergate, worked on assigning roles to user controller
  end

  def new
    @request = Request.new(user_id: params[:user_id])
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path, notice: "Your post was saved"
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
