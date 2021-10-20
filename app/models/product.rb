class Product < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Product.assign_from_row(row)
    end
  end

  def self.assign_from_row(row)
     product = Product.where(product_name: row[:product_name]).first_or_initialize
     product.assign_attributes row.to_hash.slice(:price, :quantity)
     product
  end
end
