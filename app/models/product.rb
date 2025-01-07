class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :marca
  belongs_to :tech, optional: true

  validates :name, presence: true, length: { maximum: 50 }
end
