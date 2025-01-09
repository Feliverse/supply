class Marca < ApplicationRecord
  has_many :teches
  has_many :products

  validates :name, presence: true, length: { maximum: 50 }
  validates :contact_name, presence: true, length: { maximum: 50 }
  validates :contact_number, presence: true, format: { with: /\A\d+\z/, message: "solo numeros telefonicos" }
end
