class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @therapist_bookings = current_user.therapist_bookings
    @past_patient_bookings = current_user.patient_bookings.where(status:"accepted").where("DATE(date) < ?", Date.today)
    @patient_bookings = current_user.patient_bookings.order(date: :desc)
    @profile = current_user
    # @message = booking.message
  end
end
