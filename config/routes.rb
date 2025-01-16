Rails.application.routes.draw do
  resources :almacens
  resources :clientes
  resources :categories do 
    resources :subcategories
  end

  resources :products

  resources :marcas do
    resources :teches
  end

  resources :sales, only: [:index, :new, :create]

  # Define the root path route ("/")
  root "categories#index"
end