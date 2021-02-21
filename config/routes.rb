Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #bachelorettes
  resources :bachelorettes, only: [:show] do
    #bachelorettes/contestants
    resources :contestants, only: [:index]
  end

  #contestants & outings
  resources :contestants, :outings, only: [:show]
end
