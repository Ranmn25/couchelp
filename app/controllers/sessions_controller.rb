class SessionsController < ApplicationController
  before_action :find_session, only: %i[show update]
  def index
    @applied_sessions = current_user.sessions
    @received_sessions = current_user.received_sessions
  end

  def show

  end

  def new
    @session = Session.new
    @therapist = User.find(params[:therapist_id])
  end

  def create
    @session = Session.new(session_params)
    patient = current_user
    @therapist = User.find(params[:therapist_id])
    @session.patient = patient
    @session.therapist = @therapist
    @session.status = 'pending'
    if @session.save
      redirect_to root_path, notice: 'Booked successfully.'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :time)
  end

  def find_session
    @session = Session.find(params[:id])
  end
end
