Gladius::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root :to => 'users#index'

  resources :users

  resources :send_mailers  do
    collection do
      get :invite
    end
  end

  resources :schools do
    resources :users, :controller => "user_school_relations"
  end
end

