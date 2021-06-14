class MessagesController < ApplicationController
   def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
      @chatroom,
    render_to_string(partial: "message", locals: { message: @message }))

      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  def destroy

    @message = Message.find(params[:chatroom_id])
    authorize @message
    @message.destroy
    redirect_to chatroom_path(@message.chatroom), notice: 'This chatroom was successfully destroyed.'
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
