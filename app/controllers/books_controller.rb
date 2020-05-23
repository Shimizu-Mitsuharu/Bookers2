class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_correct_user, only: %i(edit update destroy)

def show
  @book = Book.find(params[:id])
end

def create
  @new_book = Book.new(book_params)
  @new_book.user_id = current_user.id
  if @new_book.save
    flash[:success] = "You have creatad book successfully."
    redirect_to @new_book
  else
    @books = Book.all
    flash.now[:danger] = @new_book.errors
    render 'index'
  end
end

def index
  @user = current_user
  @users = User.all
  @book = Book.new
  @books = Book.all
end

def edit
  @book = Book.find(params[:id])
  redirect_to books_path if @book.user_id != current_user.id
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to @book
  else
    flash.now[:danger] = @book.errors
    render "edit"
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path
end

private

def book_params
  params.require(:book).permit(:title, :body)
end