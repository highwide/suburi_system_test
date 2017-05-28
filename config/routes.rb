Rails.application.routes.draw do
  root to: 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'users_session#new', as: :login
  get 'logout' => 'users_session#destroy', as: :logout
end
