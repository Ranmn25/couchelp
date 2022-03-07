class Message < ApplicationRecord
  belongs_to :user
  belongs_to :working_relationship

  validates :content, length: { minimum: 1 }, presence: true
end
