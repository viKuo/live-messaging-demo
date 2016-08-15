class User < ApplicationRecord
	has_secure_password

	has_many :messages
	has_many :subscriptions
	has_many :chats, through: :subscriptions

	def existing_chats_users
		existing_chat_users = []
		chats.each do |chat| 
  		chat.subscriptions.each do |subscription|
  			existing_chat_users << subscription.user if subscription.user != current_user
  		end
  	end
  	existing_chat_users
	end
end
