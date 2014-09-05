Gladius::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :invitations => 'users_invitations', :registrations => 'users/registrations' }

  root :to => 'home#index'

  resources :users, :except => [:new, :create, :destroy] do
    resources :schools
  end

  resources :schools, :only => [:index, :show] do
    resources :members
  end
end

