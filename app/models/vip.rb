class Vip < ApplicationRecord
  belongs_to :wedding
  has_many_attached :photos
end
