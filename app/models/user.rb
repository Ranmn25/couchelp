class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :therapist_bookings, class_name: 'Booking', foreign_key: 'therapist_id'
  has_many :received_bookings, through: :patients, source: :bookings
  has_many :patient_bookings, class_name: 'Booking', foreign_key: 'patient_id'
  has_many :working_relationships

  has_one_attached :photo

  validates :photo, presence: true

  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end

  def begin_working_relationship(user)
    relationship = WorkingRelationship.find_for(self, user)
    unless relationship
      therapist = is_therapist? ? self : user
      patient = is_therapist? ? user : self
      relationship = WorkingRelationship.create(therapist: therapist, patient: patient)
    end
    relationship
  end
end
