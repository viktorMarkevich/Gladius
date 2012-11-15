Gladius::Application.routes.draw do



  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root :to => 'users#index'

  resources :users
  resources :schools
end

