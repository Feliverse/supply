class Tech < ApplicationRecord
  belongs_to :marca
  has_many :products

  validates :name, presence: true, length: { maximum: 50 }
  validates :pieces_box, presence: true, numericality: { only_integer: true }
  validates :m2_box, presence: true, numericality: true
end
