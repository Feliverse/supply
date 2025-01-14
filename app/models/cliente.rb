class Cliente < ApplicationRecord
  has_many :sales

  validates :name, presence: true
  validates :nit, presence: true
end
