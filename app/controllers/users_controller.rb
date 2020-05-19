class UsersController < ApplicationController
	def show
    @user = User.find(params[:id]) #追記
end
def index
	@users =User.all
	@books = Book.all
	@book = Book.new
	@user = current_user
end

end