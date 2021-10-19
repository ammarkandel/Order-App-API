class CreateUserOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :user_orders do |t|
      t.belongs_to :order
      t.belongs_to :user

      t.datetime :created_at, null: false
    end
  end
end
