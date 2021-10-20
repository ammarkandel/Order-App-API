class User < ApplicationRecord
  has_secure_password

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
