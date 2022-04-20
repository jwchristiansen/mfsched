Rails.application.routes.draw do
  # programs
  resources :programs, only: [:create, :destroy]

  # root
  root "programs#index"
end
