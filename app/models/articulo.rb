class Articulo < ApplicationRecord
  belongs_to :subcategory
  belongs_to :marca, optional: true

  validates :name, presence: true, length: { maximum: 50 }
end
