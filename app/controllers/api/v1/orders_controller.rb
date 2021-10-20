class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:create, :change_status]
  before_action :authenticate_user

  def index
    @user_orders = User.find_by(id: params[:user_id]).orders

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
    @order = Order.find_by(id: params[:id])

    return unless params[:status].present? && Order::STATUS.include?(params[:status].to_sym)

    @order.update(status: params[:status])
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :user_id)
  end
end
