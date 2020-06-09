class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  protect_from_forgery with: :exception

  # ２ユーザーのチャットルームが既にあればその情報を@roomで取得
  # なければ新たにルームを作成し、
  def open_chat_room
    @my_rooms = current_user.user_rooms.pluck(:room_id)
    user_room = UserRoom.find_by(user_id: @user.id,room_id: @my_rooms)

    unless user_room.nil?
      @room = user_room.room
    else
      @room = Room.create
      @user.user_rooms.create(room_id: @room.id)
      current_user.user_rooms.create(room_id: @room.id)
    end

  end

  protected

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :postcode, :prefecture_code, :address_city, :address_street])
    # sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
