Rails.application.routes.draw do
  resources :inventarios
  resources :movimientos
  resources :calidads
  resources :articulos
  resources :almacens
  resources :clientes do
    collection do
      get 'find_by_nit'
    end
  end
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