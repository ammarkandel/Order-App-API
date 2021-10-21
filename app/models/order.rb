class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order_detail
  has_many :user_orders
  has_many :users, through: :user_orders
  accepts_nested_attributes_for :order_detail

  validates :total_price, presence: true, numericality: true
  validates_associated :order_detail

  STATUS = %i[accepted rejected].freeze
end
