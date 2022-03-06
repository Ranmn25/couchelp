class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show update]
  def index
    @applied_bookings = current_user.therapist_bookings
    @received_bookings = current_user.received_bookings
  end

  def show
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

  def update
    if @booking.update(booking_update_params)
      redirect_to dashboard_path, notice: 'Booking updated'
    else
      redirect_to dashboard_path, alert: 'Booking could not be updated'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end

  def booking_update_params
    params.require(:booking).permit(:status)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
