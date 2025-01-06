class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
