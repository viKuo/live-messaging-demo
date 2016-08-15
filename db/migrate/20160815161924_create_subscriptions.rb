class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :chat_id
      t.integer :user_id
    end
  end
end