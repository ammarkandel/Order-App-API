class Api::V1::OrdersController < ApplicationController
  before_action :order_params, only: [:create]
  before_action :set_user

  def index
    @user_orders = @user.orders

    render json: @user_orders, include: ['order_details']
  end

  def create
     @order = Order.new(order_params)
     @order.user_id = params[:user_id]

     if @order.save
       @order.users << @user
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
    params.require(:order).permit(:total_price)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end
