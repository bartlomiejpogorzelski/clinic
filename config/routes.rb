Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "patients#index"

  resources :patients
  resources :appointments, only: [:new, :create, :index]
  get "/generate_birth_statistics", to: "patient_statistics#generate_birth_statistics"

end
