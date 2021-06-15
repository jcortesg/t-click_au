Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vehicle_models, only: %i[create]
  resources :vehicles, only: %i[create index]
end
