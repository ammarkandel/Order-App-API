require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'Test order model validation' do
    it 'total_price should presence' do
      should validate_presence_of(:total_price)
    end
  end
end
