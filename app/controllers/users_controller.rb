class UsersController < ApplicationController
	before_action :baria_user, only: [:update]
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @address = @user.prefecture_code
    results = Geocoder.search(@address)
    @latlng = results.first.coordinates

    open_chat_room
    ## application_controller.rbに記述
    # @your_rooms = @user.user_rooms
    # @my_rooms = current_user.user_rooms
    #   @your_rooms.each do |yroom|
    #     @my_rooms.each do |mroom|
    #       if yroom.room_id == mroom.room_id
    #         @room = Room.find_by(id: yroom.room_id)
    #       end
    #     end
    #   end

    # unless @room
    #   @room = Room.create
    #   @your_room = @user.user_rooms.create(room_id: @room.id)
    #   @my_room = current_user.user_rooms.create(room_id: @room.id)
    # end
  end

  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
