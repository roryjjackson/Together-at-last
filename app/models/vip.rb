class Vip < ApplicationRecord
  belongs_to :wedding
  has_one_attached :photo
end
