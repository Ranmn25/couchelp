class WorkingRelationshipChannel < ApplicationCable::Channel
  def subscribed
    def subscribed
      chatroom = WorkingRelationship.find(params[:id])
      stream_for chatroom
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
