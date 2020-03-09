Rails.application.routes.draw do
  get '/', to: 'users#index'
  post 'users', to: 'users#create'
  get 'sessions', to: 'sessions#index'
  get 'logout', to: 'sessions#logout'
  post 'sessions', to: 'sessions#create'
  get 'dashboard', to: 'projects#index'
end
