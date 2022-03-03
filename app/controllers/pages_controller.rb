class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @therapist_bookings = current_user.therapist_bookings
    @patient_bookings = current_user.patient_bookings
    @profile = current_user
  end
end
