class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    
  end

  def search
    @users = User.search(params[:search])
    respond_to do |format|
      format.js { render 'users/user_result' }
    end
  end
  
  
  
end