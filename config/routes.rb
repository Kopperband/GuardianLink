Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  root to: 'pages#index'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'choose_user_type', to: 'pages#choose_user_type', as: 'choose_user_type'
  get '/register/:user_type', to: 'users/registrations#new', as: 'register'

  # Other routes...
end
