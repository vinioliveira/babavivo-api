require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "#validation" do
    
    let!(:user){FactoryGirl.build(:user)}

    it 'check unique user name' do
      exist_user = FactoryGirl.create(:user, email: 'jhondoe@mail.com')
      user.email = exist_user.email 
      expect(user).to be_invalid
    end
  end

  describe 'TokenAuthentication' do

    it 'respond to authentication_token' do
      expect(subject).to  respond_to :authentication_token
    end

    describe '#ensure_authentication_token' do
      context 'when saved' do
        it 'generate a token' do
          expect(FactoryGirl.create(:user).authentication_token).not_to be_blank
        end  
      end
    end
  end
end
