class TherapistsController < ApplicationController
  def index
    @therapists = User.where(is_therapist: true)
  end

  def show
    @therapist = User.find(params[:id])
  end

  private

  def therapist_paramas
    params.require(:therapist).permit
  end
end
