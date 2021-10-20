require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Test order model validation' do
    it 'total_price should presence' do
      should validate_presence_of(:price)
    end

    it 'product_name should presence' do
      should validate_presence_of(:product_name)
    end

    it 'quantity should presence' do
      should validate_presence_of(:quantity)
    end
  end
end
