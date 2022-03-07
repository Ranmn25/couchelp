class MessagesController < ApplicationController
  def create
    @chatroom = WorkingRelationship.find(params[:working_relationship_id])
    @message = Message.new(message_params)
    @message.working_relationship = @chatroom
    @message.user = current_user
    if @message.save
      WorkingRelationshipChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "working_relationships/message", locals: {message: @message})
      )
      head :ok
    else
      render "working_relationships/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
