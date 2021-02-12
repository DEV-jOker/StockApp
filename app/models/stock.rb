class Stock < ApplicationRecord
  def self.get_stock(symbol)
    IexTool.get_stock_details(symbol)
  end
  has_many :userStocks
  has_many :users,through: :userStocks 
end
