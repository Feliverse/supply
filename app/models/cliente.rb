class Cliente < ApplicationRecord
  has_many :sales

  validates :name, presence: true
  validates :nit, presence: true, 
    uniqueness: true, 
    length: { minimum: 7, maximum: 15 }, 
    numericality: { only_integer: true }
end
