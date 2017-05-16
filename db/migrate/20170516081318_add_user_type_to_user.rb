class AddUserTypeToUser < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.string :user_type, null: false, default: "human"
    end
  end
end
