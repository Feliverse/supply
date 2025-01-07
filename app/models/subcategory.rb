class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :marca_subcategories, dependent: :destroy
  has_many :marcas, through: :marca_subcategories

  validates :name, presence: true
end
