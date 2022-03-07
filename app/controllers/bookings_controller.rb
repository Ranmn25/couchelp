class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show update destroy edit]
  before_action :find_therapist, only: :edit

  def index
  end

  def show
    @chatroom = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @therapist = User.find(params[:therapist_id])
  end

  def create
    @booking = Booking.new(booking_params)
    patient = current_user
    @therapist = User.find(params[:therapist_id])
    @booking.patient = patient
    @booking.therapist = @therapist
    @booking.status = 'pending'
    if @booking.save
      redirect_to dashboard_path, notice: 'Booked successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: 'Booking updated'
    else
      redirect_to dashboard_path, alert: 'Booking could not be updated'
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_therapist
    @therapist = User.find(params[:id])
  end
end
