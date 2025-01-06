class Product < ApplicationRecord
  belongs_to :tech

  validates :name, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true, length: { maximum: 50 }
  validates :subcategory_id, presence:, true, length: { maximum: 50 }
  validates :marca_id, presence: true, length: { maximum: 50 }
  validates :tech_id, presence: true, length: { maximum: 50 }
end
