Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }



  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'admin_registration', to: 'users/registrations#admin_registration', as: 'admin_registration'
  end

  root to: 'pages#index'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'choose_user_type', to: 'pages#choose_user_type', as: 'choose_user_type'
  get '/register/:user_type', to: 'users/registrations#new', as: 'register'

  delete '/users', to: 'users/registrations#destroy'

  resources :pages do
    collection do
      patch :change_role
      post :reset_password
      post :admin_create
    end
  end

  resources :us
  # Other routes...
end
