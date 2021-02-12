class UserStocksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  def destroy
    UserStock.find_by(user_id:current_user.id,stock_id:params[:id]).delete
  end
end