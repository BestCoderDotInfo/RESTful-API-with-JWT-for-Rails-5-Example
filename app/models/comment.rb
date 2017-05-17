# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  chat_room_id :integer          not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#

class Comment < ApplicationRecord
  after_create_commit { CommentBroadcastJob.perform_later self }
  belongs_to :user
  belongs_to :chat_room
end
