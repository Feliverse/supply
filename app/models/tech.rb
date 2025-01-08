class Tech < ApplicationRecord
  belongs_to :marca
  belongs_to :subcategory
  has_many :products, dependent: :destroy

  validates :name, presence: true
end
