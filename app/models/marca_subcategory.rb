class MarcaSubcategory < ApplicationRecord
  belongs_to :marca
  belongs_to :subcategory

  validates :marca_id, length: { maximum: 50 }
  validates :subcategory_id, length: { maximum: 50 }
end
