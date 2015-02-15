module ApiHelper
  include Rack::Test::Methods
  
  def app
    Rails.application
  end

  module AuthMethods
    def login_user
      let(:user){FactoryGirl.create(:user)}
      before(:each) do
        user.confirm!
        header 'X-User-Token', user.authentication_token
        header 'X-User-Email', user.email
      end
    end
  end

  def self.included(base)
    base.extend(AuthMethods)
  end
  
end

