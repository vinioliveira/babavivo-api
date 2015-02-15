require 'spec_helper'

RSpec.describe "Championship", type: :api do
  login_user

  describe 'Retrieve championships'  do
    it 'without error' do
      get '/api/v1/player', format: :json
      expect(last_response.status).to be(200)
    end

    it 'for given user' 
    it 'for given id' 
  end
end
