require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:orders) { FactoryBot.create_list(:order, 5) }
  let!(:users) { FactoryBot.create_list(:user, 5) }
  let!(:order_id) { orders.first.id }
  let!(:user_id) { users.first.id }

  describe 'GET user orders' do

    before { get "/api/v1/users/#{user_id}/orders.json" }

    it 'Return 200 response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create new order' do
    before do
      post '/api/v1/orders.json', params: { order: { total_price: 2500, user_id: 1 } }
    end

    it 'Expected to submit the total_price' do
      expect(JSON.parse(response.body)['total_price']).to eq(2500)
    end

    it 'Expected to submit the user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq(1)
    end
  end

  describe 'PATCH Update order status' do
    before do
      patch "/api/v1/orders/#{order_id}/change_status", params: { status: 'accepted' }
    end

    it 'Expected the order status to be changed' do
      expect(JSON.parse(response.body)['status']).to eq('accepted')
    end

    it 'Return 200 response' do
      expect(response).to have_http_status(:success)
    end
  end
end
