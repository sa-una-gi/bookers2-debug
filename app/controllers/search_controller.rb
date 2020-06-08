class SearchController < ApplicationController
  def search
    method = params[:search_method]
    @user_or_book = params[:option]
    if @user_or_book == "User"
      if method == "forward_match"
        @users = User.where("name LIKE?", "#{params[:search]}%")
      elsif method == "backward_match"
        @users = User.where("name LIKE?", "%#{params[:search]}")
      elsif method == "perfect_match"
        @users = User.where(name: "#{params[:search]}")
      elsif method == "partial_match"
        @users = User.where("name LIKE?", "%#{params[:search]}%")
      else
        @users = User.all
      end

    elsif @user_or_book == "Book"
      if method == "forward_match"
        @books = Book.where("title LIKE?", "#{params[:search]}%")
      elsif method == "backward_match"
        @books = Book.where("title LIKE?", "%#{params[:search]}")
      elsif method == "perfect_match"
        @books = Book.where(title: "#{params[:search]}")
      elsif method == "partial_match"
        @books = Book.where("title LIKE?", "%#{params[:search]}%")
      else
        @books = Book.all
      end

    end
  end
end
