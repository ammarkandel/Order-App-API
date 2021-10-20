class Api::V1::ProductsController < ApplicationController

  def import
    Product.import params[:file]
  end
end
