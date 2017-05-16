class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast "room_channel", comment: data['comment']
    # Comment.create!(body: data['comment'], user_id: User.first.id)
    # Comment.create!(body: data['data']['comment'], user_id: data['data']['uid'].to_i)
    room = ChatRoom.unscope(:where).find(data['data']['room'].to_i)
    if room
      room.comments.create!(body: data['data']['comment'], user_id: data['data']['uid'].to_i)
    end
  end
end
