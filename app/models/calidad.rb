class Calidad < ApplicationRecord
  has_many :products

  validates :name, presence: true, length: { maximum: 50 }
end
