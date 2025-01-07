class Marca < ApplicationRecord
  has_many :marca_subcategories, dependent: :destroy
  has_many :subcategories, through: :marca_subcategories

  has_many :teches, dependent: :destroy

  validates :name, presence: true
  validates :contact_name, presence: true
  validates :contact_number, presence: true, format: { with: /\A\d+\z/, message: "solo numeros telefonicos" }
end
