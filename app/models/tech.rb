class Tech < ApplicationRecord
  belongs_to :marca
  belongs_to :subcategory
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :format, presence: true
  validates :pieces_box, presence: true
  validates :m2_box, presence: true
  validates :tomo_calibre, presence: true
  validates :lote, presence: true
  validates :color, presence: true
end
