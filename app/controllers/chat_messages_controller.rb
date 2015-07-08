class ChatMessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat = Chat.find(params[:chat_id])
    @chat_messages = @chat.chat_messages.recent
  end

  def create
    @chat_message = ChatMessage.new(chat_message_params)
    @chat_message.update_attribute(:chat_id, params[:chat_id])
    @chat_message.update_attribute(:user_id, current_user.id)

    respond_to do |format|
      if @chat_message.save
        format.js # Will search for create.js.erb
      else
        format.html { render chat_messages_path }
      end
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:user_id, :chat_id, :content)
  end
end
