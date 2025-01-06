class Tech < ApplicationRecord
  belongs_to :marca
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
