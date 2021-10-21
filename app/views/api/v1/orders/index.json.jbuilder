json @user_orders

json.current do
  json.details @user_orders.order_details
end
