class WorkingRelationshipsController < ApplicationController
  def show
    @chatroom = WorkingRelationship.find(params[:id])
    @message = Message.new
  end
end
