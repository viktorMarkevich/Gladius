Gladius::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root :to => 'users#index'

  resources :users do
    post 'add_user', :on => :collection
    get 'new_user', :on => :collection
  end

  resources :schools
end

