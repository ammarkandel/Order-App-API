class Api::V1::ProductsController < ApplicationController
  #before_action :authenticate_user

  def import
    Product.import params[:file]
  end
end
