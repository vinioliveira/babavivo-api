class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  private 

  def restrict_access
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:access_token])
      sign_in user, store: false
    end
  end
end
