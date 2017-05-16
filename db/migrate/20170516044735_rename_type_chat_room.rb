class RenameTypeChatRoom < ActiveRecord::Migration[5.0]
  def change
    rename_column :chat_rooms, :type, :room_type
  end
end
