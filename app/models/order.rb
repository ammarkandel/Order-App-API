class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_details
  has_many :user_orders
  has_many :users, through: :user_orders

  validates :total_price, presence: true, numericality: true

  STATUS = %i[accepted rejected].freeze
end
