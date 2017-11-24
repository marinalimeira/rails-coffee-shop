class Purchase < ApplicationRecord
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
