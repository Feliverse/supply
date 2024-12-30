class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :marcas, dependent: :destroy

  validates :name, presence: true
end
