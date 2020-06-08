class ChatsController < ApplicationController
  def show
    @chats = Chat.where(room_id: params[:id])
    @user = User.find(params[:user_id])
    @room = Room.find(params[:id])
    @chat = Chat.new
  end

  def create
    @chats = Chat.where(room_id: params[:id])
    @user = User.find(params[:user_id])
    @room = Room.find(params[:id])
    @chat = current_user.chats.new(chat_params)
    @chat.room_id = @room.id
    @chat.save
    # redirect_back(fallback_location: root_path)
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
