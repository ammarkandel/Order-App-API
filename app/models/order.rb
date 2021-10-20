class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_details
  has_many :user_orders

  STATUS = %i[accepted rejected].freeze
end
