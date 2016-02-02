class ProvidersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @requests = Request.all.where(user_id: current_user)
  end

  def show
    @provider = User.find(params[:id])
    @quote_tables = QuoteTable.where(user_id: @provider.id)
  end

end
