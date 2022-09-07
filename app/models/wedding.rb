class Wedding < ApplicationRecord
  belongs_to :user
  # has_many :wedding_guests
  has_many :rsvps
  has_many :wedding_guests
end
