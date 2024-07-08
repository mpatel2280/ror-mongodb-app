Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :posts

  resources :users

  resources :books

  resources :products

  get '/get_products', to: "products#get_products"

  get 'list_files', to: 'list_directory_files#index'
  #root 'list_directory_files#index'

  get 'export_data/export', to: 'export_data#export'

end
