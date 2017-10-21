Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :users
  get '/auth', to: 'session#vk_auth'
  get '/auth/vkontakte/callback', to: 'sessions#confirm'
end
