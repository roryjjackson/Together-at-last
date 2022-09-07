class Wedding < ApplicationRecord
  belongs_to :user
  has_many :wedding_guests
end
