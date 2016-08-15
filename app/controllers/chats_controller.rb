require 'securerandom'

class ChatsController < ApplicationController
  def index
  	chats = current_user.chats
  	@existing_chats_users = current_user.existing_chats_users
  end

  def create
    @other_user = User.find(params[:other_user])
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat,  :other_user => @other_user.id) 
  end


  def show
    @other_user = User.find(params[:other_user])

    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
    recieved_msgs = @chat.messages.where.not(user_id: current_user.id)
    recieved_msgs.each {|msg| msg.update(seen: true)}
  end

 	private

  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    nil
  end
end
