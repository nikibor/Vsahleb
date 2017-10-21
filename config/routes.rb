Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users
  resource :sessions, only: %i[show create destroy]
  get '/auth', to: 'sessions#vk_auth'
  get '/auth/vkontakte/callback', to: 'sessions#confirm'
end
