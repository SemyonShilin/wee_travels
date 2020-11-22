class ConversationChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
