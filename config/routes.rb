Rails.application.routes.draw do
  get 'admin/index'

  get 'home/index'
  root 'home#index'
  resources :users
  resources :genres
  resources :stories
  resource :studios
  resource :sessions, only: %i[show create destroy]
  # get '/auth', to: 'sessions#vk_auth'
  get '/auth/vkontakte/callback', to: 'sessions#confirm'
end
