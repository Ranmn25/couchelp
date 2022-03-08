class NotesController < ApplicationController
  def new
    @note = Note.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @note = Note.new(note_params)
    @booking = Booking.find(params[:booking_id])
    @note.booking = @booking
    if @note.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :is_private)
  end
end
