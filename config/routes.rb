Gladius::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root :to => 'users#index'

  resources :users, :except => [:new, :create, :destroy] do
    resources :schools
  end

  #resources :send_mailers  do
  #  collection do
  #    get :invite
  #  end
  #end

  resources :schools, :only => [:index, :show] do
    resources :members
   end
end

