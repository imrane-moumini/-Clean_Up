class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    def subscribed
      chatroom = Chatroom.find(params[:id])
      stream_for chatroom
    end
  end
end