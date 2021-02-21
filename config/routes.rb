Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #bachelorettes
  resources :bachelorettes, only: [:show] do
    resources :contestants, only: [:index]
  end

  #contestants
  resources :contestants, only: [:show]

  #outings
  resources :outings, only: [:show]
end
