require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST create user' do
    before do
      post '/api/v1/signup.json', params: { user: { first_name: 'Ammar', middle_name: 'El Refay', last_name: 'Kandeel', email: 'merom8703@gmail.com', phone_number: '01011637887', password: '12345678' } }
    end

    it 'Expect user with the first_name' do
      expect(JSON.parse(response.body)['first_name']).to eq('Ammar')
    end

    it 'Expect user with the middle_name' do
      expect(JSON.parse(response.body)['middle_name']).to eq('El Refay')
    end

    it 'Expect user with the last_name' do
      expect(JSON.parse(response.body)['last_name']).to eq('Kandeel')
    end

    it 'Expect user with the email' do
      expect(JSON.parse(response.body)['email']).to eq('merom8703@gmail.com')
    end
  end
end
