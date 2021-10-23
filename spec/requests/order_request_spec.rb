require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:orders) { FactoryBot.create_list(:order, 5) }
  let!(:users) { FactoryBot.create_list(:user, 5) }
  let!(:order_id) { orders.first.id }
  let!(:user_id) { users.first.id }
  let!(:first_name) { users.first.first_name }
  let!(:last_name) { users.first.last_name }

  def user_payload
    { sub: user_id, first_name: first_name, last_name: last_name }
  end

  def authenticated_header
    token = Knock::AuthToken.new(payload: user_payload).token

    { 'Authorization': "Bearer #{token}" }
  end

  describe 'GET user orders' do

    before do
      get "/api/v1/users/#{user_id}/orders.json", headers: authenticated_header
    end

    it 'Return 200 response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create new order' do
    before do
      def order_info
        { total_price: 2500, order_detail_attributes: { quantity: 500 } }
      end

      post "/api/v1/users/#{user_id}/orders.json", params: { order: order_info }, headers: authenticated_header
    end

    it 'Expected to submit the total_price' do
      expect(JSON.parse(response.body)['total_price']).to eq(2500)
    end

    it 'Return 200 response if the request is success' do
      expect(response).to have_http_status(:success)
    end

    it 'Expected to submit the user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq(user_id)
    end
  end

  describe 'PATCH Update order status' do
    before do
      patch "/api/v1/orders/#{order_id}/change_status", params: { status: 'accepted' }, headers: authenticated_header
    end

    it 'Expected the order status to be changed' do
      expect(JSON.parse(response.body)['status']).to eq('accepted')
    end

    it 'Return 200 response' do
      expect(response).to have_http_status(:success)
    end
  end
end
