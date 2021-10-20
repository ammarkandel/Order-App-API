class Api::V1::OrdersController < ApplicationController
  before_action :order_params, only: [:create]
  #before_action :authenticate_user

  def index
    @user_orders = Order.where(user_id: params[:user_id])

    render json: @user_orders
  end

  def create
     @order = Order.new(order_params)

     if @order.save
       render json: @order, status: :created
     else
       render json: @order.errors, status: :unprocessable_entity
     end
  end

  def change_status
    @get_order = Order.find_by(id: params[:id])
    return unless params[:status].present? && Order::STATUS.include?(params[:status].to_sym)

    if @get_order.update(status: params[:status])
      render json: @get_order, status: :created
    else
      render json: @get_order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :user_id)
  end
end
