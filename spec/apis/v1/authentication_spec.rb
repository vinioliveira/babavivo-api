require 'spec_helper'

RSpec.describe "Api Authentication", type: :api do

  let!(:user)  do
    user = FactoryGirl.create(:user)
    user.confirm!
    user
  end

  describe "Session controller" do 

    describe '#create' do
      it 'with email and password' do
        post "/api/v1/sessions", { user: {password: user.password, email: user.email}}, format: :json
        expect(last_response.status).to be(200)
        body = JSON.parse(last_response.body)
        expect(body['data']['auth_token']).not_to be_nil
        expect(body['data']['auth_token']).not_to be_blank
      end
    end

    context 'Without token' do
      it "can't retrieve players" do
        get "/api/v1/player", format: :json
        expect(last_response.status).to be(401)
      end
    end

    context 'allow to retrieve users with token access' do
      it 'with parammater' do
        get '/api/v1/player', {access_token: user.authentication_token, user_email: user.email}, format: :json
        expect(last_response.status).to be(200)
      end

      it 'with header' do
        header 'X-User-Token', user.authentication_token
        header 'X-User-Email', user.email
        get '/api/v1/player', format: :json
        expect(last_response.status).to be(200)
      end
    end
  end

end
