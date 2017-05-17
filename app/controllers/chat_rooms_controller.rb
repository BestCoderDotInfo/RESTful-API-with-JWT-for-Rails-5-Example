class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: [:show]

  def show
    # @comments = @room.comments.limit(5)
    @comments = Comment.where(chat_room_id: params[:id]).last(5)
  end

  private
    def set_chat_room
      @room = ChatRoom.find(params[:id])
    end
end
