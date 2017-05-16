class AddTypeToChatRoom < ActiveRecord::Migration[5.0]
  def self.up
    change_table :chat_rooms do |t|
      t.string :type, null: false, default: "public"
    end
  end
end
