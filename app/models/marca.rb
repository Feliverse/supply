class Marca < ApplicationRecord
  belongs_to :subcategory
  has_many :teches, dependent: :destroy

  validates :name, presence: true
  validates :logo, presence: true
end
