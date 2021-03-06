class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, except: [:change_status]

  def index
    @user_orders = @user.orders.includes(:order_detail)

    render json: @user_orders, include: ['order_detail']
  end

  def create
     order_params
     @order = @user.orders.new(order_params)

     if @order.save
       @order.users << @user
       render json: @order, include: ['order_detail'], status: :created
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
    params.require(:order).permit(:total_price, order_detail_attributes: [:id, :quantity, :order_id])
  end

  def set_user
    return @user if defined? @user

    @user = User.find_by(id: params[:user_id])
  end
end
