class WorkingRelationship < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :therapist, class_name: 'User'

  has_many :messages

  def self.find_for(user1, user2)
    found = find_by(patient: user1, therapist: user2)
    found = find_by(patient: user1, therapist: user2) if found.nil?
    found
  end
end

# on the show page of user if im a patient i can see anybody
# therapist can see patients only if working relationship is exist
# once you see the show page of user you can chat
# if im a patient and i begin a chat with a therapist we need to create a working relationship first
