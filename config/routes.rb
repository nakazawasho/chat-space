Rails.application.routes.draw do
  devise_for :users,     controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure
  root "groups#index"
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:new, :create]
  end
end
