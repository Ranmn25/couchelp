class Booking < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :therapist, class_name: 'User'
  has_many :messages

  before_save :reset_status

  def reset_status
    puts 'Resetting'
    if will_save_change_to_date? || will_save_change_to_time?
      self.status = 'pending'
    end
  end
end
