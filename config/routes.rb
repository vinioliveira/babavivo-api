Rails.application.routes.draw do
  devise_config = ActiveAdmin::Devise.config
  devise_for :users, devise_config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resource :player
      devise_scope :user do
        post 'sessions' => 'session#create', :as => 'login'
        delete 'sessions' => 'session#destroy', :as => 'logout'
      end
    end
  end
end

