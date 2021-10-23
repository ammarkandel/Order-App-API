class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user

  def import
    file_path = params[:file].path
    Product.import file_path
  end
end
