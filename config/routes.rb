Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Better 'stage management' interface, for the game-runner
  namespace :stage do

    get '/' => "base#index"

    resources :events, only: [:show] do
    end

    resources :players 

  end

  resources :events do
    member do
      post 'start'
      post 'stop'
      post 'change_mood'
    end
  end

  resources :players

end
