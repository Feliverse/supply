class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :marca
  belongs_to :tech
end
