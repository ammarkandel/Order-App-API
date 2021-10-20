class User < ApplicationRecord
  has_secure_password

  valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :middle_name, :last_name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: valid_email }, uniqueness: { case_sensitive: false }, length: { maximum: 105 }
  validates :password, presence: true, length: { minimum: 6, maximum: 30 }

  def to_token_payload
    {
      sub: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email: email
    }
  end

  has_many :orders
  has_many :user_orders
end
