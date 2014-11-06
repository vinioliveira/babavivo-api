require 'rails_helper'

RSpec.describe User, :type => :model do

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
