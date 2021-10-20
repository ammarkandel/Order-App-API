require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Test user model validation' do
   it 'User should have many orders' do
     should have_many(:orders)
   end

   it 'First_name should presence' do
     should validate_presence_of(:first_name)
   end

   it 'Check the validation of first_name least characters' do
     should validate_length_of(:first_name).is_at_least(3)
   end

   it 'Check the validation of middle_name least characters' do
     should validate_length_of(:middle_name).is_at_least(3)
   end

   it 'Check the validation of last_name least characters' do
     should validate_length_of(:last_name).is_at_least(3)
   end

   it 'Email should presence' do
     should validate_presence_of(:email)
   end

   it 'Check password length' do
     should validate_length_of(:password).is_at_least(6)
   end

   it 'Check password presence' do
     should validate_presence_of(:password)
   end

   it 'Test the email format' do
     should allow_value('email@addresse.test').for(:email)
     should_not allow_value('email@addressetest').for(:email)
     should_not allow_value('emailaddressetest').for(:email)
   end
 end
end
