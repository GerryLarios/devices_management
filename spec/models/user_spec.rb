require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do

    it 'is valid with valid attributes' do
      expect(create(:user)).to be_valid
    end

    it 'is not valid without name' do
      expect{ create(:user, name: nil) }.to raise_error(ActiveRecord::RecordInvalid) 
    end
    
    it 'is not valid without email' do
      expect{ create(:user, email: nil) }.to raise_error(ActiveRecord::RecordInvalid) 
    end
    
    it 'is not valid with email invalid format' do
      expect{ create(:user, email: 'invalid_email_format') }.to raise_error(ActiveRecord::RecordInvalid) 
    end
    
    it 'is not valid with non unique email' do
      user1 = create(:user, email: 'test@email.com')
      expect{ create(:user, email: 'test@email.com') }.to raise_error(ActiveRecord::RecordInvalid) 
    end
    
    it 'is not valid without password' do
      expect{ create(:user, password: nil) }.to raise_error(ActiveRecord::RecordInvalid) 
    end
  end
end
