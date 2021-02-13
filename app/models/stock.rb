class Stock < ApplicationRecord
  def self.get_stock(symbol)
    stock = IexTool.get_stock_details(symbol)
    (stock.nil?)? stock : new(symbol:stock[:symbol],price:stock[:price],name:stock[:name])
  end
  has_many :userStocks
  has_many :users,through: :userStocks 
end
