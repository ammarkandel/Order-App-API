class Product < ApplicationRecord
  validates :product_name, presence: true
  validates :price, :quantity, presence: true, numericality: true
end
