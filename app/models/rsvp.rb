class Rsvp < ApplicationRecord
  belongs_to :wedding
  belongs_to :wedding_guests
end