class AddChatRoomIdToComment < ActiveRecord::Migration[5.0]
  def self.up
    change_table :comments do |t|
      t.integer :chat_room_id, null: false
    end
  end
end
