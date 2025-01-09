class Marca < ApplicationRecord
  has_many :teches, dependent: :destroy

  validates :name, presence: true
  validates :contact_name, presence: true
  validates :contact_number, presence: true, format: { with: /\A\d+\z/, message: "solo numeros telefonicos" }
end
