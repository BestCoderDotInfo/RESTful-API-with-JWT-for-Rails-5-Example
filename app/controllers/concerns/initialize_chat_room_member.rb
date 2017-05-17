module InitializeChatRoomMember

  def init_chat_room_member(sender_user, receive_user)
    crm1 = sender_user.chat_room_members.pluck(:chat_room_id)
    crm2 = receive_user.chat_room_members.pluck(:chat_room_id)
    room_id = crm1 & crm2
    if room_id.size >= 1
      @room = ChatRoom.unscope(:where).find(room_id.first)
    else
      @room = ChatRoom.unscope(:where).where(name: "ChatRoom #{sender_user.id}-#{receive_user.id}")
      if @room.count.zero?
        @room = ChatRoom.create!(name: "ChatRoom #{sender_user.id}-#{receive_user.id}", room_type: 'private')
      else
        @room = @room.first
      end
      if ChatRoomMember.where(chat_room_id: @room.id, user_id: sender_user.id).count.zero?
        @room.chat_room_members.create!(user: sender_user)
      end
      if ChatRoomMember.where(chat_room_id: @room.id, user_id: receive_user.id).count.zero?
        @room.chat_room_members.create!(user: receive_user)
      end
    end
    @room
  end
end
