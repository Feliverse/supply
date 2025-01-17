class Cliente < ApplicationRecord
  has_many :sales

  validates :name, presence: true
  validates :nit, presence: true, uniqueness: { message: "NIT already exists" }
end
