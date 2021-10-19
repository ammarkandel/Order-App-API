class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.belongs_to :order

      t.datetime :created_at, null: false
    end
  end
end
