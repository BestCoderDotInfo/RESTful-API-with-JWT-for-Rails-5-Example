# == Schema Information
#
# Table name: chat_rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_type  :string           default("public"), not null
#

class ChatRoom < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :chat_room_members, dependent: :destroy

  default_scope { where(room_type: 'public') }

  validates_uniqueness_of :name
end
