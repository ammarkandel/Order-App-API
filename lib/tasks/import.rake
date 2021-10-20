namespace :import do
  desc "Import products from csv"
  task products: :environment do
    filename = File.join Rails.root, "products.csv"

    Product.import(filename)
  end
end
