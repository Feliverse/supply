class NotaDeRemisionItem < ApplicationRecord
  belongs_to :nota_de_remision
  belongs_to :sale_item
end
