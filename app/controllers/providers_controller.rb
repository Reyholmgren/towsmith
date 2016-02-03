class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests = Request.all.where(user_id: current_user)
    @providers = User.where(roles: 'provider')
  end

  def show
    @provider = User.find(params[:id])
    @quote_tables = QuoteTable.where(user_id: @provider.id )
    @quote_table = QuoteTable.new
    @request = Request.new
    @customer_requests = Request.where(provider_id: @provider.id)
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

  private
    def request_params
      params.require(:request).permit(:title, :provider_id, :info, :user_id)
    end
end
