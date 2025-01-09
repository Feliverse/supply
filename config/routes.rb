Rails.application.routes.draw do
  resources :categories do 
    resources :subcategories
  end

  resources :products

  resources :marcas do
    resources :teches
  end

  # Define the root path route ("/")
  root "categories#index"
end