class Marca < ApplicationRecord
  has_many :teches

  validates :name, presence: true, length: { maximum: 50 }
  validates :logo, length: { maximum: 50} ,allow_blank: true
  validates :contact_name, length: { maximum: 50 }, allow_blank: true
  validates :contact_number, format: { with: /\A\d+\z/, message: "solo numeros telefonicos" }, allow_blank: true
end

