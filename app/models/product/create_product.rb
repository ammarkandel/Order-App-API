class Product::CreateProduct

  def initialize(file_path)
    @file_path = file_path
  end

  def import_file
    counter = 0
    CSV.foreach(@file_path, headers: true, header_converters: :symbol) do |row|
      product = Product.assign_from_row(row)

      if product.save
        counter += 1
      else
        puts "#{product.product_name} - #{product.errors.full_messages.join(',')}"
      end
    end

    puts "Imported #{counter} product"
  end

  def assign_from_row(row)
     product = Product.where(product_name: row[:product_name]).first_or_initialize
     product.assign_attributes row.to_hash.slice(:price, :quantity)
     product
  end
end
