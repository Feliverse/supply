class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :marca
  belongs_to :tech

  validates :name, presence: true
  validates :category_id, presence: true
  validates :subcategory_id, presence:
  validates :marca_id, presence: true
  validates :tech_id, presence: true
end
