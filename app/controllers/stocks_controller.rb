class StocksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]
  def index
    
  end

  def new
    symbol = params[:symbol]
    unless symbol.empty?
      @stock = Stock.get_stock(symbol)
      flash.now[:alert] = "Cannot find the #{symbol} stock" if @stock.nil?
    else
        flash.now[:alert] = "Search is empty"
    end
    respond_to do |format|
      format.js { render 'stocks/stock_result' }
    end
  end

  def create
    @stock = Stock.find_by(symbol:params[:symbol])
    if @stock.nil?
      @stock = Stock.create(symbol:params[:symbol],price:params[:price],name:params[:name])
    else
      @stock.update(price:params[:price])
    end
    current_user.stocks << @stock
  end

  def destroy
    
  end
  
  
  
  
  
end
