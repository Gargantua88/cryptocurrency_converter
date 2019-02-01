Rails.application.routes.draw do
  resources :conversions, only: [:index, :create]
  resources :cryptocurrencies, only: [:index]
end
