class MessageController < ApplicationController
  include InitializeChatRoomMember
  before_action :set_user, only: :show

  def show
    @room = init_chat_room_member(current_user, @user)
    @comments = @room.comments.limit(5)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
