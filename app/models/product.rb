class Product < ApplicationRecord
  belongs_to :tech
  belongs_to :calidad

  validates :name, presence: true
  validates :tonocalibre, presence: true, if: :primera_calidad?
  
  def primera_calidad?
    calidad.name == 'primera'
  end
end
