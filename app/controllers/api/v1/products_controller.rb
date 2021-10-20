class Api::V1::ProductsController < ApplicationController

  def import
    file_path = params[:file].path
    Product.import file_path
  end
end
