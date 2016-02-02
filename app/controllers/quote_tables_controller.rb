class QuoteTablesController < ApplicationController
  before_action :quote_table_find, only: [:edit, :update, :destroy]
  def index
    @quote_tables = QuoteTable.all.order(desc: :asc)
  end

  def new 
    @quote_table = QuoteTable.new
  end

  def create
    @quote_table = QuoteTable.new(quote_table_params)
    if @quote_table.save
      redirect_to quote_tables_path, notice: "Your quote was saved"
    else
      flash[:alert] = "Error! Failed to create a new quote! Please try again."
      render :new
    end
  end

  def edit
    @quote_table = QuoteTable.find(params[:id])
  end

  def update
    if @quote_table.update(quote_table_params)
      redirect_to quote_tables_path, notice: "Your quote was edited"
    else
      render :edit
    end
  end

  def destroy
    @quote_table = QuoteTable.find(params[:id])
    if @quote_table.destroy
      redirect_to quote_tables_path, notice: "Your quote was deleted"
    else
      redirect_to quote_tables_path, alert: "Your quote was not deleted!"
    end
  end

  private

    def quote_table_find
      @quote_table = QuoteTable.find(params[:id])
    end

    def quote_table_params
      params.require(:quote_table).permit(:desc, :price)
    end
end
