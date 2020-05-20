class UsersController < ApplicationController
	def show
    @user = User.find(params[:id]) #追記
    end

    def new
    @user = User.new
    end

    def index
	@users =User.all
	@books = Book.all
	@book = Book.new
	@user = current_user
    end

    def edit
	@user = User.find(params[:id])
	if @user.id != current_user.id
		flash[:notice] = "can't successfully access!"
		redirect_to user_path(current_user.id)
	end
	end

	def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		flash[:notice] = "successfully update user!"
		redirect_to user_path(@user.id)
	else
		render :edit
	end
    end

    private
    def user_params
    	params.require(:user).permit(:profile_image)
    end
end