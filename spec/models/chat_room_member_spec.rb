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

require 'rails_helper'

RSpec.describe ChatRoomMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
