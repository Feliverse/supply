class Tech < ApplicationRecord
  belongs_to :marca
  belongs_to :subcategory
  has_many :products


  validates :name, presence: true, length: { maximum: 50 }
  validates :pieces_box, numericality: { only_integer: true }
  validates :m2_box, numericality: true
end
