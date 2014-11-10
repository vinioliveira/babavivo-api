class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  private 

  def restrict_access
    if user_token = params[:user_token].blank? && request.headers["X-User-Token"]
      params[:access_token] = user_token
    end
    if user_email = params[:user_email].blank? && request.headers["X-User-Email"]
      params[:user_email] = user_email
    end

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
