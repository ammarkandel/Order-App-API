class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.belongs_to :user
      t.string :status, null: false, default: "pending"

      t.datetime :created_at, null: false
    end
  end
end
