Rails.application.routes.draw do
  get '/', to: 'users#index'
  get 'sessions', to: 'sessions#index'
  post 'sessions', to: 'sessions#create'

  post 'users', to: 'users#create'
end
