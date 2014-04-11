Gladius::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  root :to => 'users#index'

  resources :users, :except => [:new, :create, :destroy] do
    resources :schools
  end

  resources :schools, :only => [:index, :show] do
    resources :members
  end
end

