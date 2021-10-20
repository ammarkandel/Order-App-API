class Api::V1::ProductsController < ApplicationController

  def import
    User.import params[:file]
  end
end
