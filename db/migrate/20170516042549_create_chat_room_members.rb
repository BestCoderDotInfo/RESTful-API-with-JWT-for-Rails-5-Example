class CreateChatRoomMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_room_members do |t|
      t.integer :user_id
      t.integer :chat_room_id
      t.timestamps
    end
  end
end
