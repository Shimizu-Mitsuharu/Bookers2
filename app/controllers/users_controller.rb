class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) #追記
  end
  def index
  end
end