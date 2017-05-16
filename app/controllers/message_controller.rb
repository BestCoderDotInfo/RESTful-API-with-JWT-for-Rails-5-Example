class MessageController < ApplicationController
  before_action :set_user, only: :show

  def show
    crm1 = current_user.chat_room_members.pluck(:chat_room_id)
    crm2 = @user.chat_room_members.pluck(:chat_room_id)
    room_id = crm1 & crm2
    if room_id.size >= 1
      @room = ChatRoom.unscope(:where).find(room_id.first)
    else
      @room = ChatRoom.unscope(:where).where(name: "ChatRoom #{current_user.id}-#{@user.id}")
      if @room.count.zero?
        @room = ChatRoom.create!(name: "ChatRoom #{current_user.id}-#{@user.id}", room_type: 'private')
      else
        @room = @room.first
      end
      if ChatRoomMember.where(chat_room_id: @room.id, user_id: current_user.id).count.zero?
        @room.chat_room_members.create!(user: current_user)
      end
      if ChatRoomMember.where(chat_room_id: @room.id, user_id: @user.id).count.zero?
        @room.chat_room_members.create!(user: @user)
      end
    end
    @comments = @room.comments.last(5)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
