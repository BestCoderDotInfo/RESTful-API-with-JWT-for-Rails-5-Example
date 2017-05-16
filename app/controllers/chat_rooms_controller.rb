class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: [:show]

  def show
  @comments = @room.comments.last(5)
  end

  private
    def set_chat_room
      @room = ChatRoom.find(params[:id])
    end
end
