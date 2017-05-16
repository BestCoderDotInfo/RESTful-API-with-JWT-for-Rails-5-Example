# == Schema Information
#
# Table name: chat_room_members
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  chat_room_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ChatRoomMember < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
end
