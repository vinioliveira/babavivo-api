class Api::V1::PlayersController < ApplicationController
  before_filter :restrict_access
  before_filter :authenticate_user!

  def show
    @users = User.all
    render json: {message: 'Resource not found'} 
  end

end
