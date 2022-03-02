class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :therapist_bookings, class_name: 'Booking', foreign_key: 'therapist_id'
  has_many :patient_bookings, class_name: 'Booking', foreign_key: 'patient_id'

  has_one_attached :photo
end
