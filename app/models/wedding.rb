class Wedding < ApplicationRecord
  belongs_to :user
  # has_many :wedding_guests
  has_many :vips, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_many :wedding_guests, dependent: :destroy
  has_many_attached :photos
end
