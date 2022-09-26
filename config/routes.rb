Rails.application.routes.draw do
  root "cars#index"

  resources :pilots
  resources :cars
end
