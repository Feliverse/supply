class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :teches
  
  validates :name, presence: true
end
